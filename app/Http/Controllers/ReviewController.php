<?php

namespace App\Http\Controllers;

use App\Models\ProductReview;
use App\Models\Product;
use App\Models\SiteSetting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
    public function store(Request $request, Product $product)
    {
        $settings = SiteSetting::get();
        
        // Check if reviews are enabled
        if (!$settings->reviews_enabled) {
            return back()->with('error', 'Reviews are currently disabled.');
        }

        // Check if user is authenticated (unless anonymous reviews are allowed)
        if (!$settings->reviews_allow_anonymous && !Auth::check()) {
            return back()->with('error', 'Please login to submit a review.');
        }

        // If purchase is required, verify user has purchased the product
        if ($settings->reviews_require_purchase) {
            if (!Auth::check()) {
                return back()->with('error', 'You must be logged in and have purchased this product to review it.');
            }
            
            $hasPurchased = ProductReview::hasPurchasedProduct(Auth::id(), $product->id);
            if (!$hasPurchased) {
                return back()->with('error', 'You must purchase this product before you can review it.');
            }
        }

        // Check if user already reviewed this product (only for authenticated users)
        if (Auth::check()) {
            $existingReview = ProductReview::where('product_id', $product->id)
                ->where('user_id', Auth::id())
                ->first();
            
            if ($existingReview) {
                return back()->with('error', 'You have already reviewed this product.');
            }
        }

        $validated = $request->validate([
            'rating' => ['required', 'integer', 'min:1', 'max:5'],
            'title' => ['nullable', 'string', 'max:255'],
            'comment' => ['required', 'string', 'min:10', 'max:1000'],
        ]);

        // Check if user has purchased (for verified purchase badge)
        $isVerifiedPurchase = false;
        if (Auth::check()) {
            $isVerifiedPurchase = ProductReview::hasPurchasedProduct(Auth::id(), $product->id);
        }

        $review = ProductReview::create([
            'product_id' => $product->id,
            'user_id' => Auth::id(), // Can be null if anonymous reviews are allowed
            'rating' => $validated['rating'],
            'title' => $validated['title'] ?? null,
            'comment' => $validated['comment'],
            'is_approved' => !$settings->reviews_require_approval, // Auto-approve if approval not required
            'is_verified_purchase' => $isVerifiedPurchase,
        ]);

        if ($settings->reviews_require_approval) {
            return back()->with('success', 'Thank you for your review! It will be published after approval.');
        }

        return back()->with('success', 'Thank you for your review!');
    }

    public function destroy(ProductReview $review)
    {
        // Only allow user to delete their own review
        if (Auth::check() && $review->user_id === Auth::id()) {
            $review->delete();
            return back()->with('success', 'Review deleted successfully.');
        }

        return back()->with('error', 'Unauthorized action.');
    }
}

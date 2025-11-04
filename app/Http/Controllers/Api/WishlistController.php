<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Product;
use App\Models\Wishlist;
use App\Models\GuestWishlist;
use App\Models\SiteSetting;

class WishlistController extends Controller
{
    /**
     * GET /api/wishlist (auth only)
     */
    public function index(Request $request)
    {
        $this->ensureEnabled();
        $user = $request->user();
        if (!$user) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }
        $items = Wishlist::with('product')
            ->where('user_id', $user->id)
            ->latest()
            ->get()
            ->map(function ($w) {
                return [
                    'product' => $w->product ? [
                        'id' => $w->product->id,
                        'name' => $w->product->name,
                        'slug' => $w->product->slug,
                        'sku' => $w->product->sku,
                    ] : null,
                ];
            });
        return response()->json([
            'items' => $items,
            'count' => $items->count(),
        ]);
    }

    /**
     * POST /api/wishlist/toggle (guest or auth)
     * Header: X-Wishlist-Session (for guests; if missing, server returns one)
     */
    public function toggle(Request $request)
    {
        $this->ensureEnabled();
        $request->validate([
            'product_id' => ['required', 'exists:products,id'],
        ]);
        $productId = (int) $request->input('product_id');

        if ($request->user()) {
            $userId = $request->user()->id;
            $existing = Wishlist::where('user_id', $userId)->where('product_id', $productId)->first();
            if ($existing) {
                $existing->delete();
                $count = Wishlist::where('user_id', $userId)->count();
                return response()->json(['success' => true, 'state' => 'removed', 'count' => $count]);
            }
            Wishlist::create(['user_id' => $userId, 'product_id' => $productId]);
            $count = Wishlist::where('user_id', $userId)->count();
            return response()->json(['success' => true, 'state' => 'added', 'count' => $count]);
        }

        // Guest: use header-based wishlist session (like cart's X-Cart-Session)
        $session = (string) $request->header('X-Wishlist-Session', '');
        $newSession = false;
        if ($session === '') {
            $session = (string) Str::uuid();
            $newSession = true;
        }
        $existing = GuestWishlist::where('session_id', $session)->where('product_id', $productId)->first();
        if ($existing) {
            $existing->delete();
            $count = GuestWishlist::where('session_id', $session)->count();
            return response()->json([
                'success' => true,
                'state' => 'removed',
                'count' => $count,
                'wishlist_session' => $newSession ? $session : null,
            ]);
        }
        GuestWishlist::create(['session_id' => $session, 'product_id' => $productId]);
        $count = GuestWishlist::where('session_id', $session)->count();
        return response()->json([
            'success' => true,
            'state' => 'added',
            'count' => $count,
            'wishlist_session' => $newSession ? $session : null,
        ]);
    }

    private function ensureEnabled(): void
    {
        $settings = SiteSetting::get();
        if (!($settings->wishlist_enabled ?? true)) {
            abort(404);
        }
    }
}



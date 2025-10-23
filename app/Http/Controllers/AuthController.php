<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use App\Models\User;
use App\Models\Cart;

class AuthController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
        $remember = $request->boolean('remember');

        if (Auth::attempt($credentials, $remember)) {
            $request->session()->regenerate();
            
            // Merge session cart with user cart
            $this->mergeSessionCartWithUserCart($request);
            
            return redirect()->intended('/');
        }

        return back()->withErrors([
            'email' => 'The provided credentials do not match our records.',
        ])->onlyInput('email');
    }

    public function showRegisterForm()
    {
        return view('auth.register');
    }

    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'phone' => 'nullable|string|max:20',
            'password' => ['required', 'confirmed', Password::defaults()],
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
        ]);

        Auth::login($user);

        // Merge session cart with user cart
        $this->mergeSessionCartWithUserCart($request);

        return redirect('/')->with('success', 'Account created successfully!');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }

    public function showProfile()
    {
        $user = Auth::user();
        return view('auth.profile', compact('user'));
    }

    public function updateProfile(Request $request)
    {
        $user = Auth::user();
        
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'phone' => 'nullable|string|max:20',
        ]);

        $user->update($request->only(['name', 'email', 'phone']));

        return redirect()->route('profile')->with('success', 'Profile updated successfully!');
    }

    public function changePassword(Request $request)
    {
        $request->validate([
            'current_password' => 'required',
            'password' => ['required', 'confirmed', Password::defaults()],
        ]);

        $user = Auth::user();

        if (!Hash::check($request->current_password, $user->password)) {
            return back()->withErrors([
                'current_password' => 'The current password is incorrect.',
            ]);
        }

        $user->update([
            'password' => Hash::make($request->password),
        ]);

        return redirect()->route('profile')->with('success', 'Password changed successfully!');
    }

    protected function mergeSessionCartWithUserCart(Request $request)
    {
        $sessionId = $request->session()->get('cart_session_id');
        if (!$sessionId) {
            return;
        }

        $sessionCart = Cart::where('session_id', $sessionId)->with('items')->first();
        if (!$sessionCart) {
            return;
        }

        $userCart = Cart::where('user_id', auth()->id())->with('items')->first();

        if ($userCart) {
            // Merge session cart items into user cart
            foreach ($sessionCart->items as $sessionItem) {
                $existingItem = $userCart->items()
                    ->where('product_id', $sessionItem->product_id)
                    ->first();

                if ($existingItem) {
                    // Update quantity
                    $existingItem->quantity += $sessionItem->quantity;
                    $existingItem->line_total = $existingItem->quantity * $existingItem->unit_price;
                    $existingItem->save();
                } else {
                    // Add new item
                    $sessionItem->cart_id = $userCart->id;
                    $sessionItem->save();
                }
            }

            // Recalculate totals
            $this->recalculateTotals($userCart);
            
            // Delete session cart
            $sessionCart->items()->delete();
            $sessionCart->delete();
        } else {
            // Convert session cart to user cart
            $sessionCart->user_id = auth()->id();
            $sessionCart->session_id = null;
            $sessionCart->save();
        }

        $request->session()->forget('cart_session_id');
    }

    protected function recalculateTotals(Cart $cart): void
    {
        $cart->load('items');
        $cart->subtotal = $cart->items->sum('line_total');
        $cart->discount_total = 0;
        $cart->tax_total = round($cart->subtotal * 0.00, 2);
        $cart->grand_total = $cart->subtotal - $cart->discount_total + $cart->tax_total;
        $cart->save();
    }
}
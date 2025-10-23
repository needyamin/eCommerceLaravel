<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\UserAddress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        $users = User::with(['addresses', 'orders'])
            ->latest()
            ->paginate(20);
        
        return view('admin.users.index', compact('users'));
    }

    public function show(User $user)
    {
        $user->load(['addresses', 'orders.items.product']);
        return view('admin.users.show', compact('user'));
    }

    public function edit(User $user)
    {
        return view('admin.users.edit', compact('user'));
    }

    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'phone' => 'nullable|string|max:20',
        ]);

        $user->update($request->only(['name', 'email', 'phone']));

        return redirect()->route('admin.users.show', $user)
            ->with('success', 'User updated successfully');
    }

    public function destroy(User $user)
    {
        // Prevent deletion of admin users
        if ($user->email === 'admin@example.com') {
            return redirect()->route('admin.users.index')
                ->with('error', 'Cannot delete admin user');
        }

        $user->delete();
        return redirect()->route('admin.users.index')
            ->with('success', 'User deleted successfully');
    }

    public function resetPassword(User $user)
    {
        $user->update([
            'password' => Hash::make('password')
        ]);

        return redirect()->route('admin.users.show', $user)
            ->with('success', 'Password reset to "password"');
    }

    public function toggleStatus(User $user)
    {
        // You can add an 'is_active' field to users table if needed
        // For now, we'll just return a message
        return redirect()->route('admin.users.show', $user)
            ->with('info', 'User status toggle feature can be implemented');
    }
}
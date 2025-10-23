<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserAddress;
use Illuminate\Support\Facades\Auth;

class AddressController extends Controller
{
    public function index()
    {
        $addresses = Auth::user()->addresses()->latest()->get();
        return view('addresses.index', compact('addresses'));
    }

    public function create()
    {
        return view('addresses.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'type' => 'required|in:billing,shipping',
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'company' => 'nullable|string|max:255',
            'address_line_1' => 'required|string|max:255',
            'address_line_2' => 'nullable|string|max:255',
            'city' => 'required|string|max:255',
            'state' => 'nullable|string|max:255',
            'postal_code' => 'required|string|max:20',
            'country' => 'required|string|max:255',
            'phone' => 'nullable|string|max:20',
            'is_default' => 'boolean',
        ]);

        $data = $request->all();
        $data['user_id'] = Auth::id();

        // If this is set as default, remove default from other addresses of same type
        if ($request->boolean('is_default')) {
            Auth::user()->addresses()
                ->where('type', $request->type)
                ->update(['is_default' => false]);
        }

        UserAddress::create($data);

        return redirect()->route('addresses.index')->with('success', 'Address added successfully!');
    }

    public function show(UserAddress $address)
    {
        $this->authorize('view', $address);
        return view('addresses.show', compact('address'));
    }

    public function edit(UserAddress $address)
    {
        $this->authorize('update', $address);
        return view('addresses.edit', compact('address'));
    }

    public function update(Request $request, UserAddress $address)
    {
        $this->authorize('update', $address);

        $request->validate([
            'type' => 'required|in:billing,shipping',
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'company' => 'nullable|string|max:255',
            'address_line_1' => 'required|string|max:255',
            'address_line_2' => 'nullable|string|max:255',
            'city' => 'required|string|max:255',
            'state' => 'nullable|string|max:255',
            'postal_code' => 'required|string|max:20',
            'country' => 'required|string|max:255',
            'phone' => 'nullable|string|max:20',
            'is_default' => 'boolean',
        ]);

        // If this is set as default, remove default from other addresses of same type
        if ($request->boolean('is_default')) {
            Auth::user()->addresses()
                ->where('type', $request->type)
                ->where('id', '!=', $address->id)
                ->update(['is_default' => false]);
        }

        $address->update($request->all());

        return redirect()->route('addresses.index')->with('success', 'Address updated successfully!');
    }

    public function destroy(UserAddress $address)
    {
        $this->authorize('delete', $address);
        $address->delete();
        return redirect()->route('addresses.index')->with('success', 'Address deleted successfully!');
    }

    public function setDefault(UserAddress $address)
    {
        $this->authorize('update', $address);

        // Remove default from other addresses of same type
        Auth::user()->addresses()
            ->where('type', $address->type)
            ->where('id', '!=', $address->id)
            ->update(['is_default' => false]);

        // Set this address as default
        $address->update(['is_default' => true]);

        return redirect()->route('addresses.index')->with('success', 'Default address updated!');
    }
}
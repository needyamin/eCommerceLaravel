@extends('layouts.app')

@section('title', 'My Addresses')

@section('content')
<div class="container mx-auto px-4 py-8">
    <div class="flex justify-between items-center mb-8">
        <h1 class="text-3xl font-bold">My Addresses</h1>
        <a href="{{ route('addresses.create') }}" class="bg-blue-600 text-white px-6 py-2 rounded-md hover:bg-blue-700 transition-colors">
            Add New Address
        </a>
    </div>

    @if($addresses->count() === 0)
        <div class="bg-gray-100 border border-gray-300 text-gray-700 px-4 py-8 rounded text-center">
            <p class="text-lg mb-4">You haven't added any addresses yet.</p>
            <a href="{{ route('addresses.create') }}" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition-colors">
                Add Your First Address
            </a>
        </div>
    @else
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            @foreach($addresses as $address)
                <div class="bg-white rounded-lg shadow overflow-hidden {{ $address->is_default ? 'ring-2 ring-blue-500' : '' }}">
                    <div class="px-6 py-4 border-b border-gray-200">
                        <div class="flex justify-between items-center">
                            <h3 class="text-lg font-semibold">{{ ucfirst($address->type) }} Address</h3>
                            @if($address->is_default)
                                <span class="bg-blue-100 text-blue-800 text-xs font-medium px-2.5 py-0.5 rounded">Default</span>
                            @endif
                        </div>
                    </div>
                    <div class="px-6 py-4">
                        <div class="space-y-2">
                            <p class="font-medium">{{ $address->full_name }}</p>
                            @if($address->company)
                                <p class="text-gray-600">{{ $address->company }}</p>
                            @endif
                            <p class="text-gray-600">{{ $address->address_line_1 }}</p>
                            @if($address->address_line_2)
                                <p class="text-gray-600">{{ $address->address_line_2 }}</p>
                            @endif
                            <p class="text-gray-600">{{ $address->city }}, {{ $address->state }} {{ $address->postal_code }}</p>
                            <p class="text-gray-600">{{ $address->country }}</p>
                            @if($address->phone)
                                <p class="text-gray-600">{{ $address->phone }}</p>
                            @endif
                        </div>
                    </div>
                    <div class="px-6 py-4 border-t border-gray-200 bg-gray-50">
                        <div class="flex space-x-2">
                            @if(!$address->is_default)
                                <form action="{{ route('addresses.set-default', $address) }}" method="POST" class="inline">
                                    @csrf
                                    <button type="submit" class="text-blue-600 hover:text-blue-800 text-sm font-medium">
                                        Set Default
                                    </button>
                                </form>
                            @endif
                            <a href="{{ route('addresses.edit', $address) }}" class="text-green-600 hover:text-green-800 text-sm font-medium">
                                Edit
                            </a>
                            <form action="{{ route('addresses.destroy', $address) }}" method="POST" class="inline" onsubmit="return confirm('Are you sure you want to delete this address?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="text-red-600 hover:text-red-800 text-sm font-medium">
                                    Delete
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @endif
</div>
@endsection

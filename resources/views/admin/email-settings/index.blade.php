@extends('admin.layouts.app')

@section('content')
<div class="card">
    <div class="card-header">
        <h3 class="card-title">Email Configuration</h3>
    </div>
    <form action="{{ route('admin.email-settings.update') }}" method="POST">
        @csrf
        @method('PUT')
        <div class="card-body">
            <div class="row">
                @foreach($settings as $setting)
                    <div class="col-md-6 mb-4">
                        <div class="form-group">
                            <label for="{{ $setting->key }}" class="form-label">{{ $setting->name }}</label>
                            
                            @if(in_array($setting->key, ['order_confirmation_enabled', 'order_status_update_enabled']))
                                <select name="settings[{{ $setting->key }}]" id="{{ $setting->key }}" class="form-control">
                                    <option value="1" {{ $setting->value === '1' ? 'selected' : '' }}>Enabled</option>
                                    <option value="0" {{ $setting->value === '0' ? 'selected' : '' }}>Disabled</option>
                                </select>
                            @else
                                <input type="text" 
                                       name="settings[{{ $setting->key }}]" 
                                       id="{{ $setting->key }}" 
                                       value="{{ $setting->value }}" 
                                       class="form-control">
                            @endif
                            
                            @if($setting->description)
                                <small class="form-text text-muted">{{ $setting->description }}</small>
                            @endif
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" class="btn btn-primary">Save Settings</button>
        </div>
    </form>
</div>

<div class="card mt-4">
    <div class="card-header">
        <h3 class="card-title">Email Templates</h3>
    </div>
    <div class="card-body">
        <div class="alert alert-info">
            <h5>Available Email Templates:</h5>
            <ul class="mb-0">
                <li><strong>Order Confirmation:</strong> Sent when a customer places an order</li>
                <li><strong>Order Status Update:</strong> Sent when order status changes</li>
                <li><strong>Password Reset:</strong> Sent when user requests password reset</li>
                <li><strong>Welcome Email:</strong> Sent to new users after registration</li>
            </ul>
        </div>
        <p class="text-muted">
            Email templates can be customized by modifying the notification classes in 
            <code>app/Notifications/</code> directory.
        </p>
    </div>
</div>
@endsection

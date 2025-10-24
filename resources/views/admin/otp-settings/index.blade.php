@extends('admin.layouts.app')

@section('title', 'OTP Settings')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h3 mb-0"><i class="bi bi-shield-lock me-2"></i>OTP Settings</h1>
  </div>

  <div class="card shadow-sm">
    <div class="card-body">
      <form method="POST" action="{{ route('admin.otp-settings.update') }}">
        @csrf
        @method('PUT')

        <div class="row g-3">
          <div class="col-md-3">
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" id="email_enabled" name="email_enabled" value="1" {{ $settings->email_enabled ? 'checked' : '' }}>
              <label class="form-check-label" for="email_enabled">Enable Email OTP</label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" id="sms_enabled" name="sms_enabled" value="1" {{ $settings->sms_enabled ? 'checked' : '' }}>
              <label class="form-check-label" for="sms_enabled">Enable SMS OTP</label>
            </div>
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-3">
            <label class="form-label" for="length">Code Length</label>
            <input type="number" min="4" max="8" class="form-control @error('length') is-invalid @enderror" id="length" name="length" value="{{ old('length', $settings->length) }}" required>
            @error('length')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-3">
            <label class="form-label" for="ttl_minutes">TTL (minutes)</label>
            <input type="number" min="1" max="60" class="form-control @error('ttl_minutes') is-invalid @enderror" id="ttl_minutes" name="ttl_minutes" value="{{ old('ttl_minutes', $settings->ttl_minutes) }}" required>
            @error('ttl_minutes')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-3">
            <label class="form-label" for="max_attempts">Max Attempts</label>
            <input type="number" min="1" max="10" class="form-control @error('max_attempts') is-invalid @enderror" id="max_attempts" name="max_attempts" value="{{ old('max_attempts', $settings->max_attempts) }}" required>
            @error('max_attempts')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-4">
            <label class="form-label" for="sms_gateway">SMS Gateway</label>
            <input type="text" class="form-control @error('sms_gateway') is-invalid @enderror" id="sms_gateway" name="sms_gateway" value="{{ old('sms_gateway', $settings->sms_gateway ?? config('services.sms.gateway')) }}">
            @error('sms_gateway')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-4">
            <label class="form-label" for="sms_masking">SMS Masking</label>
            <input type="text" class="form-control @error('sms_masking') is-invalid @enderror" id="sms_masking" name="sms_masking" value="{{ old('sms_masking', $settings->sms_masking ?? config('services.sms.masking')) }}">
            @error('sms_masking')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-6">
            <label class="form-label" for="sms_api_url">SMS API URL</label>
            <input type="text" class="form-control @error('sms_api_url') is-invalid @enderror" id="sms_api_url" name="sms_api_url" value="{{ old('sms_api_url', $settings->sms_api_url) }}">
            @error('sms_api_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-6">
            <label class="form-label" for="sms_api_key">SMS API Key</label>
            <input type="text" class="form-control @error('sms_api_key') is-invalid @enderror" id="sms_api_key" name="sms_api_key" value="{{ old('sms_api_key', $settings->sms_api_key) }}">
            @error('sms_api_key')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-6">
            <label class="form-label" for="sms_username">SMS Username</label>
            <input type="text" class="form-control @error('sms_username') is-invalid @enderror" id="sms_username" name="sms_username" value="{{ old('sms_username', $settings->sms_username) }}">
            @error('sms_username')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-6">
            <label class="form-label" for="sms_password">SMS Password</label>
            <input type="text" class="form-control @error('sms_password') is-invalid @enderror" id="sms_password" name="sms_password" value="{{ old('sms_password', $settings->sms_password) }}">
            @error('sms_password')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-6">
            <label class="form-label" for="sms_sender">SMS Sender Name</label>
            <input type="text" class="form-control @error('sms_sender') is-invalid @enderror" id="sms_sender" name="sms_sender" value="{{ old('sms_sender', $settings->sms_sender) }}">
            @error('sms_sender')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="mt-3">
          <button type="submit" class="btn btn-primary"><i class="bi bi-save me-1"></i>Save Settings</button>
        </div>
      </form>
    </div>
  </div>

</div>
@endsection

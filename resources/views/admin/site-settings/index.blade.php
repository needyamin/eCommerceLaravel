@extends('admin.layouts.app')

@section('title', 'Site Settings')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h3 mb-0"><i class="bi bi-gear me-2"></i>Site Settings</h1>
  </div>

  <div class="card shadow-sm">
    <div class="card-body">
      <form method="POST" action="{{ route('admin.site-settings.update') }}">
        @csrf
        @method('PUT')

        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">Site Name</label>
            <input type="text" name="site_name" class="form-control @error('site_name') is-invalid @enderror" value="{{ old('site_name', $settings->site_name) }}" required>
            @error('site_name')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-6">
            <label class="form-label">Tagline</label>
            <input type="text" name="site_tagline" class="form-control @error('site_tagline') is-invalid @enderror" value="{{ old('site_tagline', $settings->site_tagline) }}">
            @error('site_tagline')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-6">
            <label class="form-label">Logo URL</label>
            <input type="text" name="logo_url" class="form-control @error('logo_url') is-invalid @enderror" value="{{ old('logo_url', $settings->logo_url) }}">
            @error('logo_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-6">
            <label class="form-label">Favicon URL</label>
            <input type="text" name="favicon_url" class="form-control @error('favicon_url') is-invalid @enderror" value="{{ old('favicon_url', $settings->favicon_url) }}">
            @error('favicon_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-6">
            <label class="form-label">Meta Title</label>
            <input type="text" name="meta_title" class="form-control @error('meta_title') is-invalid @enderror" value="{{ old('meta_title', $settings->meta_title) }}">
            @error('meta_title')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-6">
            <label class="form-label">Meta Keywords</label>
            <input type="text" name="meta_keywords" class="form-control @error('meta_keywords') is-invalid @enderror" value="{{ old('meta_keywords', $settings->meta_keywords) }}">
            @error('meta_keywords')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-12">
            <label class="form-label">Meta Description</label>
            <textarea name="meta_description" rows="3" class="form-control @error('meta_description') is-invalid @enderror">{{ old('meta_description', $settings->meta_description) }}</textarea>
            @error('meta_description')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-4">
            <label class="form-label">Footer Text</label>
            <input type="text" name="footer_text" class="form-control @error('footer_text') is-invalid @enderror" value="{{ old('footer_text', $settings->footer_text) }}">
            @error('footer_text')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-4">
            <label class="form-label">Privacy Policy URL</label>
            <input type="text" name="privacy_url" class="form-control @error('privacy_url') is-invalid @enderror" value="{{ old('privacy_url', $settings->privacy_url) }}">
            @error('privacy_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-4">
            <label class="form-label">Terms of Service URL</label>
            <input type="text" name="terms_url" class="form-control @error('terms_url') is-invalid @enderror" value="{{ old('terms_url', $settings->terms_url) }}">
            @error('terms_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
        </div>

        <div class="row g-3 mt-1">
          <div class="col-md-4">
            <label class="form-label">Cookies URL</label>
            <input type="text" name="cookies_url" class="form-control @error('cookies_url') is-invalid @enderror" value="{{ old('cookies_url', $settings->cookies_url) }}">
            @error('cookies_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
          </div>
          <div class="col-md-8">
            <label class="form-label">Social Links</label>
            <div class="input-group mb-2">
              <span class="input-group-text"><i class="bi bi-facebook"></i></span>
              <input type="text" name="social_facebook" class="form-control" placeholder="Facebook" value="{{ old('social_facebook', $settings->social_facebook) }}">
            </div>
            <div class="input-group mb-2">
              <span class="input-group-text"><i class="bi bi-twitter"></i></span>
              <input type="text" name="social_twitter" class="form-control" placeholder="Twitter" value="{{ old('social_twitter', $settings->social_twitter) }}">
            </div>
            <div class="input-group mb-2">
              <span class="input-group-text"><i class="bi bi-instagram"></i></span>
              <input type="text" name="social_instagram" class="form-control" placeholder="Instagram" value="{{ old('social_instagram', $settings->social_instagram) }}">
            </div>
            <div class="input-group">
              <span class="input-group-text"><i class="bi bi-linkedin"></i></span>
              <input type="text" name="social_linkedin" class="form-control" placeholder="LinkedIn" value="{{ old('social_linkedin', $settings->social_linkedin) }}">
            </div>
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



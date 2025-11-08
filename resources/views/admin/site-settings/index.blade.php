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

        <!-- Basic Site Information -->
        <div class="mb-4">
          <h5 class="mb-3 border-bottom pb-2"><i class="bi bi-info-circle me-2"></i>Basic Site Information</h5>
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Site Name <span class="text-danger">*</span></label>
              <input type="text" name="site_name" class="form-control @error('site_name') is-invalid @enderror" value="{{ old('site_name', $settings->site_name) }}" required>
              @error('site_name')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-6">
              <label class="form-label">Tagline</label>
              <input type="text" name="site_tagline" class="form-control @error('site_tagline') is-invalid @enderror" value="{{ old('site_tagline', $settings->site_tagline) }}">
              @error('site_tagline')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-6">
              <label class="form-label">Logo URL</label>
              <input type="text" name="logo_url" class="form-control @error('logo_url') is-invalid @enderror" value="{{ old('logo_url', $settings->logo_url) }}" placeholder="https://example.com/logo.png">
              @error('logo_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-6">
              <label class="form-label">Favicon URL</label>
              <input type="text" name="favicon_url" class="form-control @error('favicon_url') is-invalid @enderror" value="{{ old('favicon_url', $settings->favicon_url) }}" placeholder="https://example.com/favicon.ico">
              @error('favicon_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
          </div>
        </div>

        <!-- SEO Settings -->
        <div class="mb-4">
          <h5 class="mb-3 border-bottom pb-2"><i class="bi bi-search me-2"></i>SEO Settings</h5>
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Meta Title</label>
              <input type="text" name="meta_title" class="form-control @error('meta_title') is-invalid @enderror" value="{{ old('meta_title', $settings->meta_title) }}" placeholder="Default page title">
              @error('meta_title')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-6">
              <label class="form-label">Meta Keywords</label>
              <input type="text" name="meta_keywords" class="form-control @error('meta_keywords') is-invalid @enderror" value="{{ old('meta_keywords', $settings->meta_keywords) }}" placeholder="keyword1, keyword2, keyword3">
              @error('meta_keywords')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-12">
              <label class="form-label">Meta Description</label>
              <textarea name="meta_description" rows="3" class="form-control @error('meta_description') is-invalid @enderror" placeholder="Brief description of your site">{{ old('meta_description', $settings->meta_description) }}</textarea>
              @error('meta_description')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
          </div>
        </div>

        <!-- Legal & Footer -->
        <div class="mb-4">
          <h5 class="mb-3 border-bottom pb-2"><i class="bi bi-file-text me-2"></i>Legal & Footer</h5>
          <div class="row g-3">
            <div class="col-12">
              <label class="form-label">Footer Text</label>
              <input type="text" name="footer_text" class="form-control @error('footer_text') is-invalid @enderror" value="{{ old('footer_text', $settings->footer_text) }}" placeholder="Copyright text">
              @error('footer_text')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-4">
              <label class="form-label">Privacy Policy URL</label>
              <input type="text" name="privacy_url" class="form-control @error('privacy_url') is-invalid @enderror" value="{{ old('privacy_url', $settings->privacy_url) }}" placeholder="/privacy-policy">
              @error('privacy_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-4">
              <label class="form-label">Terms of Service URL</label>
              <input type="text" name="terms_url" class="form-control @error('terms_url') is-invalid @enderror" value="{{ old('terms_url', $settings->terms_url) }}" placeholder="/terms-of-service">
              @error('terms_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-4">
              <label class="form-label">Cookies Policy URL</label>
              <input type="text" name="cookies_url" class="form-control @error('cookies_url') is-invalid @enderror" value="{{ old('cookies_url', $settings->cookies_url) }}" placeholder="/cookies-policy">
              @error('cookies_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
          </div>
        </div>

        <!-- Customer Service Links -->
        <div class="mb-4">
          <h5 class="mb-3 border-bottom pb-2"><i class="bi bi-headset me-2"></i>Customer Service Links</h5>
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Help Center URL</label>
              <input type="text" name="help_center_url" class="form-control @error('help_center_url') is-invalid @enderror" value="{{ old('help_center_url', $settings->help_center_url) }}" placeholder="/help-center">
              @error('help_center_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-6">
              <label class="form-label">Shipping Info URL</label>
              <input type="text" name="shipping_info_url" class="form-control @error('shipping_info_url') is-invalid @enderror" value="{{ old('shipping_info_url', $settings->shipping_info_url) }}" placeholder="/shipping-info">
              @error('shipping_info_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-6">
              <label class="form-label">Returns URL</label>
              <input type="text" name="returns_url" class="form-control @error('returns_url') is-invalid @enderror" value="{{ old('returns_url', $settings->returns_url) }}" placeholder="/returns">
              @error('returns_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-6">
              <label class="form-label">Contact Us URL</label>
              <input type="text" name="contact_us_url" class="form-control @error('contact_us_url') is-invalid @enderror" value="{{ old('contact_us_url', $settings->contact_us_url) }}" placeholder="/contact-us">
              @error('contact_us_url')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
          </div>
        </div>

        <!-- Social Media Links -->
        <div class="mb-4">
          <h5 class="mb-3 border-bottom pb-2"><i class="bi bi-share me-2"></i>Social Media Links</h5>
          <div class="row g-3">
            <div class="col-md-6">
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-facebook"></i></span>
                <input type="text" name="social_facebook" class="form-control" placeholder="Facebook Page URL" value="{{ old('social_facebook', $settings->social_facebook) }}">
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-twitter"></i></span>
                <input type="text" name="social_twitter" class="form-control" placeholder="Twitter Profile URL" value="{{ old('social_twitter', $settings->social_twitter) }}">
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-instagram"></i></span>
                <input type="text" name="social_instagram" class="form-control" placeholder="Instagram Profile URL" value="{{ old('social_instagram', $settings->social_instagram) }}">
              </div>
            </div>
            <div class="col-md-6">
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-linkedin"></i></span>
                <input type="text" name="social_linkedin" class="form-control" placeholder="LinkedIn Profile URL" value="{{ old('social_linkedin', $settings->social_linkedin) }}">
              </div>
            </div>
          </div>
        </div>

        <!-- Feature Toggles -->
        <div class="mb-4">
          <h5 class="mb-3 border-bottom pb-2"><i class="bi bi-toggle-on me-2"></i>Feature Toggles</h5>
          
          <!-- Wishlist -->
          <div class="row g-3 mb-3">
            <div class="col-12">
              <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" name="wishlist_enabled" value="1" id="wishlist_enabled_switch" {{ old('wishlist_enabled', (int) ($settings->wishlist_enabled ?? 1)) ? 'checked' : '' }}>
                <label class="form-check-label" for="wishlist_enabled_switch">
                  <strong>Enable Wishlist</strong>
                  <br><small class="text-muted">Show heart icon and allow users to save products to wishlist</small>
                </label>
              </div>
            </div>
          </div>

          <!-- Review Settings -->
          <div class="row g-3 mb-3" id="review-settings">
            <div class="col-12">
              <h6 class="mb-2"><i class="bi bi-star me-1"></i>Review Settings</h6>
            </div>
            <div class="col-md-6">
              <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" role="switch" name="reviews_enabled" value="1" id="reviews_enabled_switch" {{ old('reviews_enabled', (int) ($settings->reviews_enabled ?? 1)) ? 'checked' : '' }}>
                <label class="form-check-label" for="reviews_enabled_switch">
                  <strong>Enable Reviews</strong><br>
                  <small class="text-muted">Allow customers to leave product reviews</small>
                </label>
              </div>
              <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" role="switch" name="reviews_require_purchase" value="1" id="reviews_require_purchase_switch" {{ old('reviews_require_purchase', (int) ($settings->reviews_require_purchase ?? 0)) ? 'checked' : '' }}>
                <label class="form-check-label" for="reviews_require_purchase_switch">
                  <strong>Require Purchase</strong><br>
                  <small class="text-muted">Only allow reviews from customers who purchased the product</small>
                </label>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" role="switch" name="reviews_require_approval" value="1" id="reviews_require_approval_switch" {{ old('reviews_require_approval', (int) ($settings->reviews_require_approval ?? 1)) ? 'checked' : '' }}>
                <label class="form-check-label" for="reviews_require_approval_switch">
                  <strong>Require Approval</strong><br>
                  <small class="text-muted">Reviews must be approved before being published</small>
                </label>
              </div>
              <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" role="switch" name="reviews_allow_anonymous" value="1" id="reviews_allow_anonymous_switch" {{ old('reviews_allow_anonymous', (int) ($settings->reviews_allow_anonymous ?? 0)) ? 'checked' : '' }}>
                <label class="form-check-label" for="reviews_allow_anonymous_switch">
                  <strong>Allow Anonymous Reviews</strong><br>
                  <small class="text-muted">Allow non-logged-in users to submit reviews</small>
                </label>
              </div>
            </div>
          </div>

          <!-- Newsletter Settings -->
          <div class="row g-3" id="newsletter-settings">
            <div class="col-12">
              <h6 class="mb-2"><i class="bi bi-envelope-paper me-1"></i>Newsletter Settings</h6>
            </div>
            <div class="col-md-4">
              <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" role="switch" name="newsletter_enabled" value="1" id="newsletter_enabled_switch" {{ old('newsletter_enabled', (int) ($settings->newsletter_enabled ?? 1)) ? 'checked' : '' }}>
                <label class="form-check-label" for="newsletter_enabled_switch">
                  <strong>Enable Newsletter</strong><br>
                  <small class="text-muted">Allow users to subscribe to newsletter</small>
                </label>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" role="switch" name="newsletter_double_opt_in" value="1" id="newsletter_double_opt_in_switch" {{ old('newsletter_double_opt_in', (int) ($settings->newsletter_double_opt_in ?? 1)) ? 'checked' : '' }}>
                <label class="form-check-label" for="newsletter_double_opt_in_switch">
                  <strong>Require Double Opt-in</strong><br>
                  <small class="text-muted">Require email confirmation for subscriptions</small>
                </label>
              </div>
            </div>
            <div class="col-md-4">
              <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" role="switch" name="newsletter_send_welcome_email" value="1" id="newsletter_send_welcome_email_switch" {{ old('newsletter_send_welcome_email', (int) ($settings->newsletter_send_welcome_email ?? 1)) ? 'checked' : '' }}>
                <label class="form-check-label" for="newsletter_send_welcome_email_switch">
                  <strong>Send Welcome Email</strong><br>
                  <small class="text-muted">Send welcome email to new subscribers</small>
                </label>
              </div>
            </div>
          </div>
        </div>

        <!-- Product Display Settings -->
        <div class="mb-4">
          <h5 class="mb-3 border-bottom pb-2"><i class="bi bi-grid me-2"></i>Product Display Settings</h5>
          <div class="row g-3">
            <div class="col-md-6">
              <label class="form-label">Products per Row (Mobile) <span class="text-danger">*</span></label>
              <select name="product_display_columns_mobile" class="form-select @error('product_display_columns_mobile') is-invalid @enderror" required>
                <option value="1" {{ old('product_display_columns_mobile', $settings->product_display_columns_mobile ?? 2) == 1 ? 'selected' : '' }}>1 Product</option>
                <option value="2" {{ old('product_display_columns_mobile', $settings->product_display_columns_mobile ?? 2) == 2 ? 'selected' : '' }}>2 Products</option>
                <option value="3" {{ old('product_display_columns_mobile', $settings->product_display_columns_mobile ?? 2) == 3 ? 'selected' : '' }}>3 Products</option>
              </select>
              <small class="text-muted">Number of products to display per row on mobile devices</small>
              @error('product_display_columns_mobile')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
            <div class="col-md-6">
              <label class="form-label">Products per Row (Desktop) <span class="text-danger">*</span></label>
              <select name="product_display_columns_desktop" class="form-select @error('product_display_columns_desktop') is-invalid @enderror" required>
                <option value="2" {{ old('product_display_columns_desktop', $settings->product_display_columns_desktop ?? 3) == 2 ? 'selected' : '' }}>2 Products</option>
                <option value="3" {{ old('product_display_columns_desktop', $settings->product_display_columns_desktop ?? 3) == 3 ? 'selected' : '' }}>3 Products</option>
                <option value="4" {{ old('product_display_columns_desktop', $settings->product_display_columns_desktop ?? 3) == 4 ? 'selected' : '' }}>4 Products</option>
                <option value="5" {{ old('product_display_columns_desktop', $settings->product_display_columns_desktop ?? 3) == 5 ? 'selected' : '' }}>5 Products</option>
                <option value="6" {{ old('product_display_columns_desktop', $settings->product_display_columns_desktop ?? 3) == 6 ? 'selected' : '' }}>6 Products</option>
              </select>
              <small class="text-muted">Number of products to display per row on desktop/laptop screens</small>
              @error('product_display_columns_desktop')<div class="invalid-feedback">{{ $message }}</div>@enderror
            </div>
          </div>
        </div>

        <div class="mt-4 pt-3 border-top">
          <button type="submit" class="btn btn-primary"><i class="bi bi-save me-1"></i>Save All Settings</button>
        </div>
      </form>
    </div>
  </div>
</div>
@endsection

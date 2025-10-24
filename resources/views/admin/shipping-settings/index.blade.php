@extends('admin.layouts.app')

@section('title', 'Shipping Settings')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-3">
  <h1 class="h4 mb-0"><i class="bi bi-truck me-2"></i>Shipping Settings</h1>
</div>

<div class="card">
  <div class="card-body">
    <form method="post" action="{{ route('admin.shipping-settings.update') }}" class="row g-3">
      @csrf
      @method('PUT')
      <div class="col-12">
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" id="enabled" name="enabled" value="1" {{ $settings->enabled ? 'checked' : '' }}>
          <label class="form-check-label" for="enabled">Enable Shipping</label>
        </div>
      </div>
      <div class="col-md-4">
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" id="free_shipping_enabled" name="free_shipping_enabled" value="1" {{ $settings->free_shipping_enabled ? 'checked' : '' }}>
          <label class="form-check-label" for="free_shipping_enabled">Enable Free Shipping</label>
        </div>
      </div>
      <div class="col-md-4">
        <label class="form-label">Free Shipping Minimum Total</label>
        <input type="number" step="0.01" name="free_shipping_min_total" class="form-control @error('free_shipping_min_total') is-invalid @enderror" value="{{ old('free_shipping_min_total', $settings->free_shipping_min_total) }}">
        @error('free_shipping_min_total')<div class="invalid-feedback">{{ $message }}</div>@enderror
      </div>
      <div class="col-12">
        <hr>
        <h6>Global Default Rate</h6>
        <div class="row g-2 align-items-end mb-3">
          <div class="col-md-3">
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" id="global_rate_enabled" name="global_rate_enabled" value="1" {{ $settings->global_rate_enabled ? 'checked' : '' }}>
              <label class="form-check-label" for="global_rate_enabled">Enable Global Rate</label>
            </div>
          </div>
          <div class="col-md-3">
            <select name="global_rate_type" class="form-select">
              <option value="flat" {{ ($settings->global_rate_type ?? 'flat')==='flat'?'selected':'' }}>Flat</option>
              <option value="percent" {{ ($settings->global_rate_type ?? '')==='percent'?'selected':'' }}>Percent</option>
            </select>
          </div>
          <div class="col-md-3">
            <input type="number" step="0.01" name="global_rate_amount" class="form-control" value="{{ $settings->global_rate_amount ?? 0 }}" placeholder="Amount">
          </div>
        </div>

        <hr>
        <h6>Per-Country/City Rates</h6>
        <div id="countryRates">
          @php($rates = $settings->country_rates ?? [])
          @foreach($rates as $conf)
          <div class="row g-2 align-items-end mb-2">
            <div class="col-md-4">
              <input type="text" name="country_rates[][country]" class="form-control" value="{{ $conf['country'] ?? '' }}" placeholder="Country">
            </div>
            <div class="col-md-3">
              <input type="text" name="country_rates[][city]" class="form-control" value="{{ $conf['city'] ?? '' }}" placeholder="City (optional)">
            </div>
            <div class="col-md-2">
              <select name="country_rates[][type]" class="form-select">
                <option value="flat" {{ ($conf['type'] ?? 'flat')==='flat'?'selected':'' }}>Flat</option>
                <option value="percent" {{ ($conf['type'] ?? '')==='percent'?'selected':'' }}>Percent</option>
              </select>
            </div>
            <div class="col-md-2">
              <input type="number" step="0.01" name="country_rates[][amount]" class="form-control" value="{{ $conf['amount'] ?? 0 }}" placeholder="Amount">
            </div>
            <div class="col-md-2">
              <button class="btn btn-outline-danger w-100" onclick="this.closest('.row').remove(); return false;">Remove</button>
            </div>
          </div>
          @endforeach
        </div>
        <button class="btn btn-outline-secondary" onclick="addRateRow(); return false;">Add Country Rate</button>
      </div>
      <div class="col-12">
        <button class="btn btn-primary"><i class="bi bi-save me-1"></i>Save</button>
      </div>
    </form>
  </div>
</div>

@push('scripts')
<script>
function addRateRow(){
  const idx = Date.now();
  const container = document.getElementById('countryRates');
  const div = document.createElement('div');
  div.className = 'row g-2 align-items-end mb-2';
  div.innerHTML = `
    <div class="col-md-4">
      <input type="text" name="country_rates[][country]" class="form-control" placeholder="Country">
    </div>
    <div class="col-md-3">
      <input type="text" name="country_rates[][city]" class="form-control" placeholder="City (optional)">
    </div>
    <div class="col-md-2">
      <select name="country_rates[][type]" class="form-select">
        <option value="flat">Flat</option>
        <option value="percent">Percent</option>
      </select>
    </div>
    <div class="col-md-2">
      <input type="number" step="0.01" name="country_rates[][amount]" class="form-control" placeholder="Amount">
    </div>
    <div class="col-md-2">
      <button class="btn btn-outline-danger w-100" onclick="this.closest('.row').remove(); return false;">Remove</button>
    </div>
  `;
  container.appendChild(div);
}
</script>
@endpush
@endsection



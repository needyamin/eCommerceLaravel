<div class="row g-3">
  <div class="col-md-3">
    <label for="code" class="form-label">Code *</label>
    <input type="text" class="form-control @error('code') is-invalid @enderror" id="code" name="code" value="{{ old('code', $currency->code ?? '') }}" placeholder="USD" required>
    @error('code')<div class="invalid-feedback">{{ $message }}</div>@enderror
  </div>
  <div class="col-md-5">
    <label for="name" class="form-label">Name *</label>
    <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name', $currency->name ?? '') }}" placeholder="US Dollar" required>
    @error('name')<div class="invalid-feedback">{{ $message }}</div>@enderror
  </div>
  <div class="col-md-2">
    <label for="symbol" class="form-label">Symbol *</label>
    <input type="text" class="form-control @error('symbol') is-invalid @enderror" id="symbol" name="symbol" value="{{ old('symbol', $currency->symbol ?? '') }}" placeholder="$" required>
    @error('symbol')<div class="invalid-feedback">{{ $message }}</div>@enderror
  </div>
  <div class="col-md-2">
    <label for="precision" class="form-label">Precision *</label>
    <input type="number" min="0" max="8" class="form-control @error('precision') is-invalid @enderror" id="precision" name="precision" value="{{ old('precision', $currency->precision ?? 2) }}" required>
    @error('precision')<div class="invalid-feedback">{{ $message }}</div>@enderror
  </div>
</div>

<div class="row g-3 mt-1">
  <div class="col-md-3">
    <label for="thousand_separator" class="form-label">Thousand Separator *</label>
    <input type="text" class="form-control @error('thousand_separator') is-invalid @enderror" id="thousand_separator" name="thousand_separator" value="{{ old('thousand_separator', $currency->thousand_separator ?? ',') }}" required>
    @error('thousand_separator')<div class="invalid-feedback">{{ $message }}</div>@enderror
  </div>
  <div class="col-md-3">
    <label for="decimal_separator" class="form-label">Decimal Separator *</label>
    <input type="text" class="form-control @error('decimal_separator') is-invalid @enderror" id="decimal_separator" name="decimal_separator" value="{{ old('decimal_separator', $currency->decimal_separator ?? '.') }}" required>
    @error('decimal_separator')<div class="invalid-feedback">{{ $message }}</div>@enderror
  </div>
  <div class="col-md-3">
    <label for="rate" class="form-label">Rate *</label>
    <input type="number" step="0.00000001" min="0" class="form-control @error('rate') is-invalid @enderror" id="rate" name="rate" value="{{ old('rate', $currency->rate ?? 1) }}" required>
    @error('rate')<div class="invalid-feedback">{{ $message }}</div>@enderror
  </div>
  <div class="col-md-3">
    <label class="form-label">Placement *</label>
    <select name="symbol_first" class="form-select @error('symbol_first') is-invalid @enderror" required>
      <option value="1" {{ old('symbol_first', $currency->symbol_first ?? 1) ? 'selected' : '' }}>Symbol before</option>
      <option value="0" {{ old('symbol_first', $currency->symbol_first ?? 1) ? '' : 'selected' }}>Symbol after</option>
    </select>
    @error('symbol_first')<div class="invalid-feedback">{{ $message }}</div>@enderror
  </div>
</div>

<div class="row g-3 mt-1">
  <div class="col-md-3">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="is_active" name="is_active" value="1" {{ old('is_active', $currency->is_active ?? true) ? 'checked' : '' }}>
      <label class="form-check-label" for="is_active">Active</label>
    </div>
  </div>
  <div class="col-md-3">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="is_default" name="is_default" value="1" {{ old('is_default', $currency->is_default ?? false) ? 'checked' : '' }}>
      <label class="form-check-label" for="is_default">Default</label>
    </div>
  </div>
</div>

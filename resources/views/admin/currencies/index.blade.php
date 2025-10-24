@extends('admin.layouts.app')

@section('title', 'Currencies')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h3 mb-0"><i class="bi bi-currency-exchange me-2"></i>Currencies</h1>
    <a href="{{ route('admin.currencies.create') }}" class="btn btn-primary"><i class="bi bi-plus-lg me-1"></i>Add Currency</a>
  </div>

  <div class="card shadow-sm">
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-hover mb-0">
          <thead class="table-light">
            <tr>
              <th>Code</th>
              <th>Name</th>
              <th>Symbol</th>
              <th>Rate</th>
              <th>Status</th>
              <th>Default</th>
              <th class="text-end">Actions</th>
            </tr>
          </thead>
          <tbody>
            @forelse($currencies as $currency)
              <tr>
                <td><code>{{ $currency->code }}</code></td>
                <td>{{ $currency->name }}</td>
                <td>{{ $currency->symbol_first ? $currency->symbol.' 100.00' : '100.00 '.$currency->symbol }}</td>
                <td>{{ $currency->rate }}</td>
                <td>
                  <span class="badge {{ $currency->is_active ? 'bg-success' : 'bg-secondary' }}">{{ $currency->is_active ? 'Active' : 'Inactive' }}</span>
                </td>
                <td>
                  @if($currency->is_default)
                    <span class="badge bg-primary">Default</span>
                  @else
                    <form action="{{ route('admin.currencies.default', $currency) }}" method="POST" class="d-inline">
                      @csrf
                      <button class="btn btn-sm btn-outline-primary" type="submit">Set Default</button>
                    </form>
                  @endif
                </td>
                <td class="text-end">
                  <div class="btn-group">
                    <a href="{{ route('admin.currencies.edit', $currency) }}" class="btn btn-sm btn-info"><i class="bi bi-pencil"></i></a>
                    <form action="{{ route('admin.currencies.toggle', $currency) }}" method="POST" class="d-inline">
                      @csrf
                      <button class="btn btn-sm btn-{{ $currency->is_active ? 'warning' : 'success' }}" type="submit">
                        <i class="bi bi-{{ $currency->is_active ? 'pause' : 'play' }}"></i>
                      </button>
                    </form>
                    <form action="{{ route('admin.currencies.destroy', $currency) }}" method="POST" class="d-inline" onsubmit="return confirm('Delete this currency?')">
                      @csrf
                      @method('DELETE')
                      <button class="btn btn-sm btn-danger" type="submit"><i class="bi bi-trash"></i></button>
                    </form>
                  </div>
                </td>
              </tr>
            @empty
              <tr>
                <td colspan="7" class="text-center p-4 text-muted">No currencies found.</td>
              </tr>
            @endforelse
          </tbody>
        </table>
      </div>
      <div class="p-3">{{ $currencies->links() }}</div>
    </div>
  </div>
</div>
@endsection

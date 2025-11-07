@extends('admin.layouts.app')

@section('title', 'Dashboard')

@section('content')
<div class="row g-4">
  <div class="col-md-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <div class="text-muted small">Orders</div>
          <div class="h3 mb-0 fw-bold">{{ $stats['orders'] }}</div>
        </div>
        <div class="text-primary"><i class="bi bi-bag fs-1"></i></div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <div class="text-muted small">Products</div>
          <div class="h3 mb-0 fw-bold">{{ $stats['products'] }}</div>
        </div>
        <div class="text-success"><i class="bi bi-box-seam fs-1"></i></div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <div class="text-muted small">Categories</div>
          <div class="h3 mb-0 fw-bold">{{ $stats['categories'] }}</div>
        </div>
        <div class="text-warning"><i class="bi bi-diagram-3 fs-1"></i></div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <div class="text-muted small">Customers</div>
          <div class="h3 mb-0 fw-bold">{{ $stats['customers'] }}</div>
        </div>
        <div class="text-info"><i class="bi bi-people fs-1"></i></div>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="card border-0 shadow-sm">
      <div class="card-body d-flex justify-content-between align-items-center">
        <div>
          <div class="text-muted small">Revenue</div>
          <div class="h3 mb-0 fw-bold">@currency($stats['revenue'])</div>
        </div>
        <div class="text-danger"><i class="bi bi-cash-coin fs-1"></i></div>
      </div>
    </div>
  </div>
</div>

<div class="row g-4 mt-1">
  <div class="col-lg-8">
    <div class="card border-0 shadow-sm">
      <div class="card-header bg-body">Sales & Orders (last 14 days)</div>
      <div class="card-body">
        <canvas id="salesChart" height="120"></canvas>
      </div>
    </div>
  </div>
  <div class="col-lg-4">
    <div class="card border-0 shadow-sm mb-4">
      <div class="card-header bg-body">Recent Orders</div>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-sm mb-0">
            <thead><tr><th>#</th><th>Total</th><th>Date</th></tr></thead>
            <tbody>
              @forelse($recentOrders as $o)
                <tr>
                  <td>{{ $o->number }}</td>
                  <td>@currency($o->grand_total)</td>
                  <td>{{ $o->created_at->format('M d') }}</td>
                </tr>
              @empty
                <tr><td colspan="3" class="text-center">No data</td></tr>
              @endforelse
            </tbody>
          </table>
        </div>
      </div>
    </div>
    <div class="card border-0 shadow-sm">
      <div class="card-header bg-body">Low Stock</div>
      <div class="card-body p-0">
        <div class="table-responsive">
          <table class="table table-sm mb-0">
            <thead><tr><th>Product</th><th>Stock</th></tr></thead>
            <tbody>
              @forelse($lowStock as $p)
                <tr>
                  <td>{{ $p->name }}</td>
                  <td><span class="badge bg-danger">{{ $p->stock }}</span></td>
                </tr>
              @empty
                <tr><td colspan="2" class="text-center">All good</td></tr>
              @endforelse
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function(){
  const ctx = document.getElementById('salesChart');
  if(!ctx) return;
  const chart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: @json($labels),
      datasets: [
        { label: 'Orders', data: @json($ordersSeries), borderColor: '#0d6efd', backgroundColor: 'rgba(13,110,253,0.1)', tension: .3 },
        { label: 'Revenue', data: @json($revenueSeries), borderColor: '#dc3545', backgroundColor: 'rgba(220,53,69,0.1)', tension: .3, yAxisID: 'y1' },
      ]
    },
    options: {
      responsive: true,
      scales: {
        y: { beginAtZero: true, title: { display: true, text: 'Orders' } },
        y1: { beginAtZero: true, position: 'right', grid: { drawOnChartArea: false }, title: { display: true, text: 'Revenue' } }
      },
      plugins: { legend: { position: 'bottom' } }
    }
  });
});
</script>
@endpush
@endsection



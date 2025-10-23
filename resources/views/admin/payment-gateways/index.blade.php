@extends('admin.layouts.app')

@section('title', 'Payment Gateways')

@section('content')
<div class="container-fluid">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="h3 mb-0 text-gray-800">
                <i class="fas fa-credit-card me-2"></i>Payment Gateways
            </h1>
            <p class="text-muted">Manage payment gateway settings and configurations</p>
        </div>
    </div>

    <!-- Payment Gateways Grid -->
    <div class="row">
        @foreach($gateways as $gatewayName => $gateway)
            <div class="col-lg-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">
                            <i class="fas fa-{{ $gatewayName === 'stripe' ? 'stripe' : 'paypal' }} me-2"></i>
                            {{ $gateway['display_name'] }}
                        </h5>
                        <div class="d-flex gap-2">
                            <form action="{{ route('admin.payment-gateways.toggle-status', $gatewayName) }}" method="POST" class="d-inline">
                                @csrf
                                <button type="submit" class="btn btn-sm {{ $gateway['enabled'] ? 'btn-success' : 'btn-secondary' }}">
                                    <i class="fas fa-power-off me-1"></i>
                                    {{ $gateway['enabled'] ? 'Enabled' : 'Disabled' }}
                                </button>
                            </form>
                            <button type="button" class="btn btn-sm btn-info test-connection" data-gateway="{{ $gatewayName }}">
                                <i class="fas fa-plug me-1"></i>Test
                            </button>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h6 class="text-muted mb-2">Status</h6>
                                <span class="badge {{ $gateway['enabled'] ? 'bg-success' : 'bg-secondary' }}">
                                    {{ $gateway['enabled'] ? 'Active' : 'Inactive' }}
                                </span>
                            </div>
                            <div class="col-md-6">
                                <h6 class="text-muted mb-2">Configuration</h6>
                                <span class="badge bg-info">
                                    {{ count($gateway['config']) }} Settings
                                </span>
                            </div>
                        </div>
                        
                        <div class="mt-3">
                            <a href="{{ route('admin.payment-gateways.show', $gatewayName) }}" 
                               class="btn btn-primary btn-sm">
                                <i class="fas fa-cog me-1"></i>Configure
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    <!-- Recent Activity -->
    <div class="row mt-4">
        <div class="col-12">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-history me-2"></i>Recent Payment Activity
                    </h5>
                </div>
                <div class="card-body">
                    @if($recentLogs->count() > 0)
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Gateway</th>
                                        <th>Action</th>
                                        <th>Data</th>
                                        <th>IP Address</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($recentLogs as $log)
                                        <tr>
                                            <td>
                                                <span class="badge bg-primary">{{ ucfirst($log->gateway) }}</span>
                                            </td>
                                            <td>
                                                <code>{{ $log->action }}</code>
                                            </td>
                                            <td>
                                                @if($log->data)
                                                    <button type="button" class="btn btn-sm btn-outline-info" 
                                                            data-bs-toggle="modal" 
                                                            data-bs-target="#logModal{{ $log->id }}">
                                                        <i class="fas fa-eye"></i>
                                                    </button>
                                                @else
                                                    <span class="text-muted">No data</span>
                                                @endif
                                            </td>
                                            <td>{{ $log->ip_address ?? 'N/A' }}</td>
                                            <td>{{ $log->created_at->format('M d, Y H:i') }}</td>
                                        </tr>
                                        
                                        <!-- Log Data Modal -->
                                        @if($log->data)
                                            <div class="modal fade" id="logModal{{ $log->id }}" tabindex="-1">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Log Data - {{ ucfirst($log->gateway) }}</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <pre class="bg-light p-3 rounded"><code>{{ json_encode($log->data, JSON_PRETTY_PRINT) }}</code></pre>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        @endif
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @else
                        <div class="text-center py-4">
                            <i class="fas fa-history fa-3x text-muted mb-3"></i>
                            <p class="text-muted">No payment activity logs found.</p>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Test Connection Modal -->
<div class="modal fade" id="testConnectionModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Test Connection</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div id="testResult"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Test connection functionality
    document.querySelectorAll('.test-connection').forEach(button => {
        button.addEventListener('click', function() {
            const gateway = this.dataset.gateway;
            const modal = new bootstrap.Modal(document.getElementById('testConnectionModal'));
            const resultDiv = document.getElementById('testResult');
            
            resultDiv.innerHTML = '<div class="text-center"><i class="fas fa-spinner fa-spin fa-2x"></i><br>Testing connection...</div>';
            modal.show();
            
            fetch(`{{ route('admin.payment-gateways.index') }}/${gateway}/test`, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                    'Content-Type': 'application/json',
                },
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    resultDiv.innerHTML = `
                        <div class="alert alert-success">
                            <i class="fas fa-check-circle me-2"></i>
                            <strong>Success!</strong> ${data.message}
                        </div>
                        <pre class="bg-light p-2 rounded"><code>${JSON.stringify(data.details, null, 2)}</code></pre>
                    `;
                } else {
                    resultDiv.innerHTML = `
                        <div class="alert alert-danger">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            <strong>Failed!</strong> ${data.message}
                        </div>
                    `;
                }
            })
            .catch(error => {
                resultDiv.innerHTML = `
                    <div class="alert alert-danger">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <strong>Error!</strong> ${error.message}
                    </div>
                `;
            });
        });
    });
});
</script>
@endsection

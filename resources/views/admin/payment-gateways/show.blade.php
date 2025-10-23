@extends('admin.layouts.app')

@section('title', 'Configure ' . ucfirst($gateway) . ' Payment Gateway')

@section('content')
<div class="container-fluid">
    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="h3 mb-0 text-gray-800">
                <i class="fas fa-{{ $gateway === 'stripe' ? 'stripe' : 'paypal' }} me-2"></i>
                Configure {{ ucfirst($gateway) }} Payment Gateway
            </h1>
            <p class="text-muted">Manage {{ ucfirst($gateway) }} payment gateway settings and configurations</p>
        </div>
        <div>
            <a href="{{ route('admin.payment-gateways.index') }}" class="btn btn-secondary">
                <i class="fas fa-arrow-left me-1"></i>Back to Gateways
            </a>
        </div>
    </div>

    <div class="row">
        <!-- Settings Form -->
        <div class="col-lg-8">
            <div class="card shadow-sm">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-cog me-2"></i>Gateway Settings
                    </h5>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.payment-gateways.update', $gateway) }}" method="POST">
                        @csrf
                        @method('PUT')

                        @if($gateway === 'stripe')
                            <!-- Stripe Settings -->
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="enabled" value="1" 
                                               id="enabled" {{ $gatewayInstance->isEnabled() ? 'checked' : '' }}>
                                        <label class="form-check-label" for="enabled">
                                            <strong>Enable Stripe Payment Gateway</strong>
                                        </label>
                                    </div>
                                    <small class="text-muted">Enable or disable Stripe payment processing</small>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="publishable_key" class="form-label">
                                        <i class="fas fa-key me-1"></i>Publishable Key *
                                    </label>
                                    <input type="text" 
                                           class="form-control @error('publishable_key') is-invalid @enderror" 
                                           id="publishable_key" 
                                           name="publishable_key" 
                                           value="{{ old('publishable_key', $settings->where('key', 'publishable_key')->first()->value ?? '') }}"
                                           placeholder="pk_test_...">
                                    @error('publishable_key')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                    <small class="text-muted">Your Stripe publishable key (starts with pk_)</small>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="secret_key" class="form-label">
                                        <i class="fas fa-lock me-1"></i>Secret Key *
                                    </label>
                                    <input type="password" 
                                           class="form-control @error('secret_key') is-invalid @enderror" 
                                           id="secret_key" 
                                           name="secret_key" 
                                           value="{{ old('secret_key', $settings->where('key', 'secret_key')->first()->value ?? '') }}"
                                           placeholder="sk_test_...">
                                    @error('secret_key')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                    <small class="text-muted">Your Stripe secret key (starts with sk_) - This will be encrypted</small>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="webhook_secret" class="form-label">
                                        <i class="fas fa-webhook me-1"></i>Webhook Secret
                                    </label>
                                    <input type="password" 
                                           class="form-control @error('webhook_secret') is-invalid @enderror" 
                                           id="webhook_secret" 
                                           name="webhook_secret" 
                                           value="{{ old('webhook_secret', $settings->where('key', 'webhook_secret')->first()->value ?? '') }}"
                                           placeholder="whsec_...">
                                    @error('webhook_secret')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                    <small class="text-muted">Stripe webhook endpoint secret for secure webhook verification</small>
                                </div>
                            </div>

                        @elseif($gateway === 'paypal')
                            <!-- PayPal Settings -->
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="enabled" value="1" 
                                               id="enabled" {{ $gatewayInstance->isEnabled() ? 'checked' : '' }}>
                                        <label class="form-check-label" for="enabled">
                                            <strong>Enable PayPal Payment Gateway</strong>
                                        </label>
                                    </div>
                                    <small class="text-muted">Enable or disable PayPal payment processing</small>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="client_id" class="form-label">
                                        <i class="fas fa-id-card me-1"></i>Client ID *
                                    </label>
                                    <input type="text" 
                                           class="form-control @error('client_id') is-invalid @enderror" 
                                           id="client_id" 
                                           name="client_id" 
                                           value="{{ old('client_id', $settings->where('key', 'client_id')->first()->value ?? '') }}"
                                           placeholder="Your PayPal Client ID">
                                    @error('client_id')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                    <small class="text-muted">Your PayPal application client ID</small>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="client_secret" class="form-label">
                                        <i class="fas fa-lock me-1"></i>Client Secret *
                                    </label>
                                    <input type="password" 
                                           class="form-control @error('client_secret') is-invalid @enderror" 
                                           id="client_secret" 
                                           name="client_secret" 
                                           value="{{ old('client_secret', $settings->where('key', 'client_secret')->first()->value ?? '') }}"
                                           placeholder="Your PayPal Client Secret">
                                    @error('client_secret')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                    <small class="text-muted">Your PayPal application client secret - This will be encrypted</small>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" name="sandbox_mode" value="1" 
                                               id="sandbox_mode" {{ $settings->where('key', 'sandbox_mode')->first()->value ?? true ? 'checked' : '' }}>
                                        <label class="form-check-label" for="sandbox_mode">
                                            <strong>Sandbox Mode</strong>
                                        </label>
                                    </div>
                                    <small class="text-muted">Use PayPal sandbox for testing (recommended for development)</small>
                                </div>
                            </div>
                        @endif

                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i>Save Settings
                            </button>
                            
                            <button type="button" class="btn btn-info test-connection" data-gateway="{{ $gateway }}">
                                <i class="fas fa-plug me-1"></i>Test Connection
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Gateway Info & Logs -->
        <div class="col-lg-4">
            <!-- Gateway Status -->
            <div class="card shadow-sm mb-4">
                <div class="card-header">
                    <h6 class="mb-0">
                        <i class="fas fa-info-circle me-2"></i>Gateway Information
                    </h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">
                            <strong>Status:</strong><br>
                            <span class="badge {{ $gatewayInstance->isEnabled() ? 'bg-success' : 'bg-secondary' }}">
                                {{ $gatewayInstance->isEnabled() ? 'Enabled' : 'Disabled' }}
                            </span>
                        </div>
                        <div class="col-6">
                            <strong>Settings:</strong><br>
                            <span class="badge bg-info">{{ $settings->count() }} Configured</span>
                        </div>
                    </div>
                    
                    <hr>
                    
                    <div class="d-grid gap-2">
                        <form action="{{ route('admin.payment-gateways.toggle-status', $gateway) }}" method="POST" class="d-inline">
                            @csrf
                            <button type="submit" class="btn btn-sm {{ $gatewayInstance->isEnabled() ? 'btn-warning' : 'btn-success' }} w-100">
                                <i class="fas fa-power-off me-1"></i>
                                {{ $gatewayInstance->isEnabled() ? 'Disable' : 'Enable' }} Gateway
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Recent Logs -->
            <div class="card shadow-sm">
                <div class="card-header">
                    <h6 class="mb-0">
                        <i class="fas fa-history me-2"></i>Recent Activity
                    </h6>
                </div>
                <div class="card-body">
                    @if($logs->count() > 0)
                        <div class="list-group list-group-flush">
                            @foreach($logs->take(10) as $log)
                                <div class="list-group-item px-0 py-2">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <code class="text-primary">{{ $log->action }}</code>
                                            <br>
                                            <small class="text-muted">{{ $log->created_at->format('M d, H:i') }}</small>
                                        </div>
                                        @if($log->data)
                                            <button type="button" class="btn btn-sm btn-outline-info" 
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#logModal{{ $log->id }}">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                        @endif
                                    </div>
                                </div>
                                
                                <!-- Log Data Modal -->
                                @if($log->data)
                                    <div class="modal fade" id="logModal{{ $log->id }}" tabindex="-1">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Log Data - {{ $log->action }}</h5>
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
                        </div>
                    @else
                        <div class="text-center py-3">
                            <i class="fas fa-history fa-2x text-muted mb-2"></i>
                            <p class="text-muted mb-0">No activity logs found</p>
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
                <h5 class="modal-title">Test {{ ucfirst($gateway) }} Connection</h5>
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

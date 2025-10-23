@extends('admin.layouts.app')

@section('title', 'Newsletter')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h1 class="h3 mb-0"><i class="bi bi-envelope-paper me-2"></i>Newsletter</h1>
  </div>

  <div class="row">
    <div class="col-lg-4">
      <div class="card shadow-sm mb-4">
        <div class="card-header">
          <h5 class="mb-0"><i class="bi bi-gear me-2"></i>Settings</h5>
        </div>
        <div class="card-body">
          <form action="{{ route('admin.newsletter.settings.update') }}" method="POST">
            @csrf
            @method('PUT')
            <div class="form-check form-switch mb-3">
              <input class="form-check-input" type="checkbox" id="enabled" name="enabled" value="1" {{ $settings->enabled ? 'checked' : '' }}>
              <label class="form-check-label" for="enabled">Enable Newsletter</label>
            </div>
            <div class="form-check form-switch mb-3">
              <input class="form-check-input" type="checkbox" id="double_opt_in" name="double_opt_in" value="1" {{ $settings->double_opt_in ? 'checked' : '' }}>
              <label class="form-check-label" for="double_opt_in">Require Double Opt-in</label>
            </div>
            <div class="form-check form-switch mb-3">
              <input class="form-check-input" type="checkbox" id="send_welcome_email" name="send_welcome_email" value="1" {{ $settings->send_welcome_email ? 'checked' : '' }}>
              <label class="form-check-label" for="send_welcome_email">Send Welcome Email</label>
            </div>
            <input type="hidden" name="provider" value="local">
            <button type="submit" class="btn btn-primary w-100"><i class="bi bi-save me-1"></i>Save Settings</button>
          </form>
        </div>
      </div>
    </div>

    <div class="col-lg-8">
      <div class="card shadow-sm">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0"><i class="bi bi-people me-2"></i>Subscribers</h5>
        </div>
        <div class="card-body p-0">
          <div class="table-responsive">
            <table class="table table-hover mb-0">
              <thead class="table-light">
                <tr>
                  <th>Email</th>
                  <th>Name</th>
                  <th>Status</th>
                  <th>Source</th>
                  <th>Subscribed</th>
                  <th class="text-end">Actions</th>
                </tr>
              </thead>
              <tbody>
                @forelse($subscribers as $subscriber)
                  <tr>
                    <td>{{ $subscriber->email }}</td>
                    <td>{{ $subscriber->name ?? '-' }}</td>
                    <td>
                      <span class="badge {{ $subscriber->status === 'subscribed' ? 'bg-success' : 'bg-secondary' }}">
                        {{ ucfirst($subscriber->status) }}
                      </span>
                    </td>
                    <td><span class="badge bg-info">{{ $subscriber->source ?? '-' }}</span></td>
                    <td>{{ $subscriber->subscribed_at ? $subscriber->subscribed_at->format('M d, Y') : '-' }}</td>
                    <td class="text-end">
                      <form action="{{ route('admin.newsletter.toggle', $subscriber) }}" method="POST" class="d-inline">
                        @csrf
                        <button class="btn btn-sm btn-outline-warning" type="submit">
                          <i class="bi bi-toggle2-on"></i>
                        </button>
                      </form>
                      <form action="{{ route('admin.newsletter.destroy', $subscriber) }}" method="POST" class="d-inline" onsubmit="return confirm('Remove subscriber?')">
                        @csrf
                        @method('DELETE')
                        <button class="btn btn-sm btn-outline-danger" type="submit">
                          <i class="bi bi-trash"></i>
                        </button>
                      </form>
                    </td>
                  </tr>
                @empty
                  <tr>
                    <td colspan="6" class="text-center p-4 text-muted">No subscribers yet.</td>
                  </tr>
                @endforelse
              </tbody>
            </table>
          </div>
          <div class="p-3">
            {{ $subscribers->links() }}
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection

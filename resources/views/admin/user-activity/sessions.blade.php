@extends('admin.layouts.app')

@section('title', 'Login Activity')

@section('content')
<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="h3 mb-0"><i class="bi bi-person-lines-fill me-2"></i>Login Activity</h1>
  </div>

  <div class="card shadow-sm">
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-striped align-middle mb-0">
          <thead>
            <tr>
              <th>User</th>
              <th>Email</th>
              <th>Phone</th>
              <th>IP</th>
              <th>User Agent</th>
              <th>Last Activity</th>
              <th>Session</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            @forelse($sessions as $s)
              @php $u = optional($s->user); @endphp
              <tr>
                <td>
                  {{ $u->name ?? '—' }}
                  @if(!$s->user_id)
                    <span class="badge bg-secondary ms-1">Guest</span>
                  @endif
                </td>
                <td>{{ $u->email ?? '—' }}</td>
                <td>{{ $u->phone ?? '—' }}</td>
                <td><code>{{ $s->ip_address ?? '—' }}</code></td>
                <td class="small" title="{{ $s->user_agent }}">{{ Str::limit($s->user_agent, 60) }}</td>
                <td>{{ \Carbon\Carbon::createFromTimestamp($s->last_activity)->format('Y-m-d H:i') }}</td>
                <td class="small"><code>{{ $s->id }}</code></td>
                <td class="text-end">
                  <form action="{{ route('admin.activities.sessions.destroy', $s->id) }}" method="post" onsubmit="return confirm('Destroy this session?')">
                    @csrf
                    @method('DELETE')
                    <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                  </form>
                </td>
              </tr>
            @empty
              <tr><td colspan="8" class="text-center text-muted py-4">No sessions found.</td></tr>
            @endforelse
          </tbody>
        </table>
      </div>
    </div>
    @if($sessions->hasPages())
      <div class="card-footer">{{ $sessions->links() }}</div>
    @endif
  </div>

  <div class="card shadow-sm mt-3">
    <div class="card-body">
      <form class="row g-2 align-items-end" action="{{ route('admin.activities.sessions.destroy-user', 0) }}" method="post" onsubmit="return confirm('Destroy all sessions for this user?')" id="destroyUserSessionsForm">
        @csrf
        @method('DELETE')
        <div class="col-md-4">
          <label class="form-label">User ID</label>
          <input type="number" min="1" class="form-control" id="dus_user_id" placeholder="Enter user ID">
        </div>
        <div class="col-md-3">
          <button type="button" class="btn btn-outline-danger" onclick="__destroyUserSessions()"><i class="bi bi-x-circle"></i> Destroy All Sessions (User)</button>
        </div>
      </form>
      <script>
        function __destroyUserSessions(){
          const form = document.getElementById('destroyUserSessionsForm');
          const uid = document.getElementById('dus_user_id').value;
          if(!uid) return;
          form.action = form.action.replace(/\d+$/, String(uid));
          form.submit();
        }
      </script>
    </div>
  </div>
</div>
@endsection



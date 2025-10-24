@extends('admin.layouts.app')

@section('title', 'Administrators')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-3">
  <h1 class="h4 mb-0"><i class="bi bi-shield-lock me-2"></i>Administrators</h1>
  <a href="{{ route('admin.admins.create') }}" class="btn btn-primary btn-sm"><i class="bi bi-plus-lg me-1"></i>Add Admin</a>
  </div>

<div class="card">
  <div class="card-body p-0">
    <div class="table-responsive">
      <table class="table table-striped mb-0">
        <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Roles</th><th></th></tr></thead>
        <tbody>
          @forelse($admins as $admin)
            <tr>
              <td>{{ $admin->id }}</td>
              <td>{{ $admin->name }}</td>
              <td>{{ $admin->email }}</td>
              <td>
                @foreach($admin->roles as $role)
                  <span class="badge text-bg-secondary">{{ $role->name }}</span>
                @endforeach
              </td>
              <td class="text-end">
                <a href="{{ route('admin.admins.edit', $admin) }}" class="btn btn-sm btn-outline-primary">Edit</a>
                @if($admin->email !== 'admin@example.com')
                  <form action="{{ route('admin.admins.destroy', $admin) }}" method="post" class="d-inline" onsubmit="return confirm('Delete this admin?')">
                    @csrf @method('DELETE')
                    <button class="btn btn-sm btn-outline-danger">Delete</button>
                  </form>
                @endif
              </td>
            </tr>
          @empty
            <tr><td colspan="5" class="text-center">No administrators</td></tr>
          @endforelse
        </tbody>
      </table>
    </div>
  </div>
  <div class="card-footer">{{ $admins->links() }}</div>
</div>
@endsection



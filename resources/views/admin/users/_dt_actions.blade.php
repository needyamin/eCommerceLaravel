@php($u = $u ?? $user ?? null)
<div class="btn-group" role="group">
    <a href="{{ route('admin.users.show', $u) }}" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i> View</a>
    <a href="{{ route('admin.users.edit', $u) }}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i> Edit</a>
    @if($u->email !== 'admin@example.com')
    <form action="{{ route('admin.users.destroy', $u) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this user?')">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i> Delete</button>
    </form>
    @endif
</div>


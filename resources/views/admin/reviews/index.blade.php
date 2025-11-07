@extends('admin.layouts.app')

@section('content')
<div class="card">
    <div class="card-header d-flex flex-wrap gap-2 justify-content-between align-items-center">
        <h3 class="card-title m-0">Product Reviews</h3>
        <form method="GET" action="{{ route('admin.reviews.index') }}" class="d-flex gap-2">
            <select name="status" class="form-select form-select-sm" style="min-width: 150px;">
                <option value="">All Reviews</option>
                <option value="approved" {{ request('status') === 'approved' ? 'selected' : '' }}>Approved</option>
                <option value="pending" {{ request('status') === 'pending' ? 'selected' : '' }}>Pending</option>
            </select>
            <input type="text" name="search" class="form-control form-control-sm" placeholder="Search..." value="{{ request('search') }}" style="min-width: 200px;">
            <button type="submit" class="btn btn-sm btn-primary">Filter</button>
            @if(request()->hasAny(['status', 'search']))
                <a href="{{ route('admin.reviews.index') }}" class="btn btn-sm btn-outline-secondary">Clear</a>
            @endif
        </form>
    </div>
    <div class="card-body">
        @if($reviews->count() > 0)
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>User</th>
                            <th>Rating</th>
                            <th>Review</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($reviews as $review)
                            <tr>
                                <td>
                                    <a href="{{ route('products.show', $review->product->slug) }}" target="_blank">
                                        {{ $review->product->name }}
                                    </a>
                                </td>
                                <td>
                                    {{ $review->user->name ?? 'Anonymous' }}
                                    @if($review->is_verified_purchase)
                                        <span class="badge bg-success ms-1" title="Verified Purchase">
                                            <i class="bi bi-check-circle"></i>
                                        </span>
                                    @endif
                                </td>
                                <td>
                                    @for($i = 1; $i <= 5; $i++)
                                        <i class="bi bi-star{{ $i <= $review->rating ? '-fill text-warning' : '' }}"></i>
                                    @endfor
                                    <span class="ms-1">({{ $review->rating }})</span>
                                </td>
                                <td>
                                    @if($review->title)
                                        <strong>{{ $review->title }}</strong><br>
                                    @endif
                                    <small class="text-muted">{{ Str::limit($review->comment, 100) }}</small>
                                </td>
                                <td>
                                    @if($review->is_approved)
                                        <span class="badge bg-success">Approved</span>
                                    @else
                                        <span class="badge bg-warning">Pending</span>
                                    @endif
                                </td>
                                <td>{{ $review->created_at->format('M d, Y') }}</td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        @if(!$review->is_approved)
                                            <form action="{{ route('admin.reviews.approve', $review) }}" method="POST" class="d-inline">
                                                @csrf
                                                <button type="submit" class="btn btn-success" title="Approve">
                                                    <i class="bi bi-check"></i>
                                                </button>
                                            </form>
                                        @else
                                            <form action="{{ route('admin.reviews.reject', $review) }}" method="POST" class="d-inline">
                                                @csrf
                                                <button type="submit" class="btn btn-warning" title="Reject">
                                                    <i class="bi bi-x"></i>
                                                </button>
                                            </form>
                                        @endif
                                        <form action="{{ route('admin.reviews.destroy', $review) }}" method="POST" class="d-inline" onsubmit="return confirm('Delete this review?')">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger" title="Delete">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="mt-3">
                {{ $reviews->links() }}
            </div>
        @else
            <div class="alert alert-info">
                <i class="bi bi-info-circle me-2"></i>No reviews found.
            </div>
        @endif
    </div>
</div>
@endsection


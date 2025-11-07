<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;

class DataTableController extends Controller
{
    public function handle(string $resource, Request $request)
    {
        try {
            $draw = (int) $request->input('draw', 0);
            $start = (int) $request->input('start', 0);
            $length = (int) $request->input('length', 10);
            $search = (string) data_get($request->input('search', []), 'value', '');

            $handlerMethod = 'resource' . Str::studly(Str::singular($resource));
            if (!method_exists($this, $handlerMethod)) {
                return response()->json([
                    'draw' => $draw,
                    'recordsTotal' => 0,
                    'recordsFiltered' => 0,
                    'data' => [],
                    'error' => 'Handler not found for resource: ' . $resource
                ]);
            }

            return $this->{$handlerMethod}($request, $draw, $start, $length, $search);
        } catch (\Exception $e) {
            Log::error('DataTable error: ' . $e->getMessage(), [
                'resource' => $resource,
                'trace' => $e->getTraceAsString()
            ]);
            return response()->json([
                'draw' => (int) $request->input('draw', 0),
                'recordsTotal' => 0,
                'recordsFiltered' => 0,
                'data' => [],
                'error' => 'An error occurred: ' . $e->getMessage()
            ], 500);
        }
    }

    protected function resourceProduct(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\Product::query()->with('category');

        $recordsTotal = (clone $query)->count();

        // Filters
        if ($request->filled('category_id')) {
            $query->where('category_id', (int) $request->input('category_id'));
        }
        if ($request->filled('is_active')) {
            $query->where('is_active', (int) $request->input('is_active'));
        }

        // Search
        if ($search !== '') {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('sku', 'like', "%{$search}%");
            });
        }

        $recordsFiltered = (clone $query)->count();

        // Ordering
        $order = $this->extractOrdering($request, ['name', 'category', 'price', 'is_active']);
        if ($order) {
            $hasCategoryJoin = false;
            foreach ($order as [$col, $dir]) {
                if ($col === 'category') {
                    if (!$hasCategoryJoin) {
                        $query->leftJoin('categories', 'categories.id', '=', 'products.category_id');
                        $hasCategoryJoin = true;
                    }
                    $query->orderBy('categories.name', $dir);
                } else {
                    $query->orderBy('products.' . $col, $dir);
                }
            }
        } else {
            $query->latest('products.id');
        }

        $items = $query->select('products.*')->skip($start)->take($length)->get();

        $data = $items->map(function ($p) {
            return [
                'name' => e($p->name),
                'category' => e(optional($p->category)->name ?? '-'),
                'price' => '$' . number_format((float) $p->price, 2),
                'is_active' => $p->is_active ? '<span class="badge text-bg-success">Yes</span>' : '<span class="badge text-bg-secondary">No</span>',
                'actions' => $this->safeRenderView('admin.products._dt_actions', compact('p')),
            ];
        })->all();

        return response()->json([
            'draw' => $draw,
            'recordsTotal' => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data' => $data,
        ]);
    }

    protected function resourceCategory(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\Category::query();
        $recordsTotal = (clone $query)->count();

        if ($request->filled('is_active')) {
            $query->where('is_active', (int) $request->input('is_active'));
        }
        if ($search !== '') {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('slug', 'like', "%{$search}%");
            });
        }
        $recordsFiltered = (clone $query)->count();

        $order = $this->extractOrdering($request, ['name', 'slug', 'is_active']);
        if ($order) {
            foreach ($order as [$col, $dir]) { $query->orderBy($col, $dir); }
        } else {
            $query->latest('id');
        }

        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function ($c) {
            return [
                'name' => e($c->name),
                'slug' => e($c->slug),
                'is_active' => $c->is_active ? '<span class="badge text-bg-success">Yes</span>' : '<span class="badge text-bg-secondary">No</span>',
                'actions' => $this->safeRenderView('admin.categories._dt_actions', compact('c')),
            ];
        })->all();

        return response()->json([
            'draw' => $draw,
            'recordsTotal' => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data' => $data,
        ]);
    }

    protected function resourceOrder(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\Order::query()->with('user');
        $recordsTotal = (clone $query)->count();

        if ($request->filled('status')) { $query->where('status', $request->string('status')); }
        if ($request->filled('payment_status')) { $query->where('payment_status', $request->string('payment_status')); }
        if ($request->filled('from')) { $query->whereDate('created_at', '>=', $request->date('from')); }
        if ($request->filled('to')) { $query->whereDate('created_at', '<=', $request->date('to')); }

        if ($search !== '') {
            $query->where(function ($q) use ($search) {
                $q->where('number', 'like', "%{$search}%")
                  ->orWhereHas('user', function ($uq) use ($search) {
                      $uq->where('name', 'like', "%{$search}%")->orWhere('email', 'like', "%{$search}%");
                  });
            });
        }

        $recordsFiltered = (clone $query)->count();

        $order = $this->extractOrdering($request, ['number', 'customer', 'status', 'payment_status', 'shipping_status', 'grand_total', 'created_at']);
        if ($order) {
            foreach ($order as [$col, $dir]) {
                $col = $col === 'customer' ? 'id' : $col; // keep deterministic
                $query->orderBy($col, $dir);
            }
        } else { $query->latest('id'); }

        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function ($o) {
            $statusClass = match($o->status){ 'pending'=>'warning','processing'=>'info','cancelled'=>'danger','delivered'=>'success', default=>'secondary' };
            $payClass = $o->payment_status === 'paid' ? 'success' : ($o->payment_status === 'refunded' ? 'secondary' : 'warning');
            $shipClass = match($o->shipping_status){ 'unshipped'=>'secondary','shipped'=>'info','delivered'=>'success','returned'=>'danger', default=>'warning' };
            return [
                'number' => e($o->number),
                'customer' => e(optional($o->user)->name ?? 'Guest') . '<br><small class="text-muted">' . e(optional($o->user)->email ?? '') . '</small>',
                'status' => '<span class="badge text-bg-' . $statusClass . '">' . e(ucfirst($o->status)) . '</span>',
                'payment_status' => '<span class="badge text-bg-' . $payClass . '">' . e(ucfirst($o->payment_status)) . '</span>',
                'shipping_status' => '<span class="badge text-bg-' . $shipClass . '">' . e(ucfirst($o->shipping_status)) . '</span>',
                'grand_total' => '$' . number_format((float) $o->grand_total, 2),
                'created_at' => $o->created_at->format('M d, Y'),
                'actions' => '<a href="' . route('admin.orders.show', $o) . '" class="btn btn-sm btn-primary">View</a>',
            ];
        })->all();

        return response()->json([
            'draw' => $draw,
            'recordsTotal' => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data' => $data,
        ]);
    }

    protected function resourceUser(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\User::query()->withCount(['addresses', 'orders']);
        $recordsTotal = (clone $query)->count();

        if ($request->filled('from')) { $query->whereDate('created_at', '>=', $request->date('from')); }
        if ($request->filled('to')) { $query->whereDate('created_at', '<=', $request->date('to')); }

        if ($search !== '') {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                  ->orWhere('email', 'like', "%{$search}%")
                  ->orWhere('phone', 'like', "%{$search}%");
            });
        }

        $recordsFiltered = (clone $query)->count();

        $order = $this->extractOrdering($request, ['id','name','email','phone','addresses_count','orders_count','created_at']);
        if ($order) { foreach ($order as [$c,$d]) { $query->orderBy($c,$d); } } else { $query->latest('id'); }

        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function ($u) {
            return [
                'id' => $u->id,
                'name' => e($u->name),
                'email' => e($u->email),
                'phone' => e($u->phone ?? 'N/A'),
                'addresses_count' => '<span class="badge bg-info">' . (int) $u->addresses_count . '</span>',
                'orders_count' => '<span class="badge bg-success">' . (int) $u->orders_count . '</span>',
                'created_at' => $u->created_at->format('M d, Y'),
                'actions' => $this->safeRenderView('admin.users._dt_actions', compact('u')),
            ];
        })->all();

        return response()->json([
            'draw' => $draw,
            'recordsTotal' => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data' => $data,
        ]);
    }

    protected function resourceRole(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \Spatie\Permission\Models\Role::query()->where('guard_name', 'admin');
        $recordsTotal = (clone $query)->count();
        if ($search !== '') { $query->where('name', 'like', "%{$search}%"); }
        $recordsFiltered = (clone $query)->count();
        $order = $this->extractOrdering($request, ['name']);
        if ($order) { foreach ($order as [$c,$d]) { $query->orderBy($c,$d); } }
        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function ($r) { return [ 'name' => e($r->name), 'actions' => $this->safeRenderView('admin.roles._dt_actions', compact('r')) ]; })->all();
        return response()->json(['draw'=>$draw,'recordsTotal'=>$recordsTotal,'recordsFiltered'=>$recordsFiltered,'data'=>$data]);
    }

    protected function resourcePermission(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \Spatie\Permission\Models\Permission::query()->where('guard_name', 'admin');
        $recordsTotal = (clone $query)->count();
        if ($search !== '') { $query->where('name', 'like', "%{$search}%"); }
        $recordsFiltered = (clone $query)->count();
        $order = $this->extractOrdering($request, ['name']);
        if ($order) { foreach ($order as [$c,$d]) { $query->orderBy($c,$d); } }
        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function ($p) { return [ 'name' => e($p->name), 'actions' => $this->safeRenderView('admin.permissions._dt_actions', compact('p')) ]; })->all();
        return response()->json(['draw'=>$draw,'recordsTotal'=>$recordsTotal,'recordsFiltered'=>$recordsFiltered,'data'=>$data]);
    }

    protected function resourceCoupon(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\Coupon::query()->withCount('usages');
        $recordsTotal = (clone $query)->count();
        if ($request->filled('type')) { $query->where('type', $request->string('type')); }
        if ($request->filled('is_active')) { $query->where('is_active', (int) $request->input('is_active')); }
        if ($search !== '') { $query->where(function($q) use($search){ $q->where('code','like',"%{$search}%")->orWhere('name','like',"%{$search}%"); }); }
        $recordsFiltered = (clone $query)->count();
        $order = $this->extractOrdering($request, ['code','name','type','value','usages_count','is_active','expires_at']);
        if ($order) { foreach ($order as [$c,$d]) { $query->orderBy($c,$d); } } else { $query->latest('id'); }
        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function($c){
            $typeBadge = $c->type === 'percentage' ? 'badge-info' : 'badge-success';
            return [
                'code' => '<code class="bg-light px-2 py-1 rounded">' . e($c->code) . '</code>',
                'name' => e($c->name),
                'type' => '<span class="badge ' . $typeBadge . '">' . e(ucfirst($c->type)) . '</span>',
                'value' => $c->type === 'percentage' ? (int) $c->value . '%' : '$' . number_format((float) $c->value, 2),
                'usages_count' => (int) $c->usages_count . ($c->usage_limit ? (' / ' . (int) $c->usage_limit) : ''),
                'is_active' => $c->is_active ? '<span class="badge badge-success">Active</span>' : '<span class="badge badge-secondary">Inactive</span>',
                'expires_at' => $c->expires_at ? $c->expires_at->format('M d, Y') : '<span class="text-muted">Never</span>',
                'actions' => $this->safeRenderView('admin.coupons._dt_actions', compact('c')),
            ];
        })->all();
        return response()->json(['draw'=>$draw,'recordsTotal'=>$recordsTotal,'recordsFiltered'=>$recordsFiltered,'data'=>$data]);
    }

    protected function resourceNewsletter(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\NewsletterSubscriber::query();
        $recordsTotal = (clone $query)->count();
        if ($request->filled('status')) { $query->where('status', $request->string('status')); }
        if ($search !== '') { $query->where(function($q) use($search){ $q->where('email','like',"%{$search}%")->orWhere('name','like',"%{$search}%"); }); }
        $recordsFiltered = (clone $query)->count();
        $order = $this->extractOrdering($request, ['email','name','status','source','subscribed_at']);
        if ($order) { foreach ($order as [$c,$d]) { $query->orderBy($c,$d); } } else { $query->latest('id'); }
        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function($s){
            $statusBadge = $s->status === 'subscribed' ? 'bg-success' : 'bg-secondary';
            return [
                'email' => e($s->email),
                'name' => e($s->name ?? '-'),
                'status' => '<span class="badge ' . $statusBadge . '">' . e(ucfirst($s->status)) . '</span>',
                'source' => '<span class="badge bg-info">' . e($s->source ?? '-') . '</span>',
                'subscribed_at' => $s->subscribed_at ? $s->subscribed_at->format('M d, Y') : '-',
                'actions' => $this->safeRenderView('admin.newsletter._dt_actions', compact('s')),
            ];
        })->all();
        return response()->json(['draw'=>$draw,'recordsTotal'=>$recordsTotal,'recordsFiltered'=>$recordsFiltered,'data'=>$data]);
    }

    protected function resourceCurrency(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\Currency::query();
        $recordsTotal = (clone $query)->count();
        if ($request->filled('is_active')) { $query->where('is_active', (int) $request->input('is_active')); }
        if ($search !== '') { $query->where(function($q) use($search){ $q->where('code','like',"%{$search}%")->orWhere('name','like',"%{$search}%"); }); }
        $recordsFiltered = (clone $query)->count();
        $order = $this->extractOrdering($request, ['code','name','rate','is_active','is_default']);
        if ($order) { foreach ($order as [$c,$d]) { $query->orderBy($c,$d); } } else { $query->latest('id'); }
        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function($c){
            return [
                'code' => '<code>' . e($c->code) . '</code>',
                'name' => e($c->name),
                'rate' => e($c->rate),
                'is_active' => $c->is_active ? '<span class="badge bg-success">Active</span>' : '<span class="badge bg-secondary">Inactive</span>',
                'is_default' => $c->is_default ? '<span class="badge bg-primary">Default</span>' : '',
                'actions' => $this->safeRenderView('admin.currencies._dt_actions', compact('c')),
            ];
        })->all();
        return response()->json(['draw'=>$draw,'recordsTotal'=>$recordsTotal,'recordsFiltered'=>$recordsFiltered,'data'=>$data]);
    }

    protected function resourceAdmin(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\Admin::query()->with('roles');
        $recordsTotal = (clone $query)->count();
        if ($search !== '') { $query->where(function($q) use($search){ $q->where('name','like',"%{$search}%")->orWhere('email','like',"%{$search}%"); }); }
        $recordsFiltered = (clone $query)->count();
        $order = $this->extractOrdering($request, ['id','name','email']);
        if ($order) { foreach ($order as [$c,$d]) { $query->orderBy($c,$d); } } else { $query->latest('id'); }
        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function($a){
            $roles = $a->roles->map(fn($r) => '<span class="badge text-bg-secondary">' . e($r->name) . '</span>')->implode(' ');
            return [
                'id' => $a->id,
                'name' => e($a->name),
                'email' => e($a->email),
                'roles' => $roles,
                'actions' => $this->safeRenderView('admin.admins._dt_actions', compact('a')),
            ];
        })->all();
        return response()->json(['draw'=>$draw,'recordsTotal'=>$recordsTotal,'recordsFiltered'=>$recordsFiltered,'data'=>$data]);
    }

    protected function resourcePage(Request $request, int $draw, int $start, int $length, string $search)
    {
        $query = \App\Models\Page::query();
        $recordsTotal = (clone $query)->count();

        if ($request->filled('is_active')) {
            $query->where('is_active', (int) $request->input('is_active'));
        }

        if ($search !== '') {
            $query->where(function ($q) use ($search) {
                $q->where('title', 'like', "%{$search}%")
                  ->orWhere('slug', 'like', "%{$search}%")
                  ->orWhere('content', 'like', "%{$search}%");
            });
        }

        $recordsFiltered = (clone $query)->count();

        $order = $this->extractOrdering($request, ['title', 'slug', 'is_active', 'sort_order']);
        if ($order) {
            foreach ($order as [$col, $dir]) {
                $query->orderBy($col, $dir);
            }
        } else {
            $query->orderBy('sort_order', 'asc')->orderBy('title', 'asc');
        }

        $items = $query->skip($start)->take($length)->get();
        $data = $items->map(function ($p) {
            return [
                'title' => e($p->title),
                'slug' => '<code class="bg-light px-2 py-1 rounded">' . e($p->slug) . '</code>',
                'is_active' => $p->is_active ? '<span class="badge text-bg-success">Active</span>' : '<span class="badge text-bg-secondary">Inactive</span>',
                'sort_order' => (int) $p->sort_order,
                'actions' => $this->safeRenderView('admin.pages._dt_actions', compact('p')),
            ];
        })->all();

        return response()->json([
            'draw' => $draw,
            'recordsTotal' => $recordsTotal,
            'recordsFiltered' => $recordsFiltered,
            'data' => $data,
        ]);
    }

    /**
     * Extract ordering from DataTables request.
     * @return array<int, array{0:string,1:string}>
     */
    protected function extractOrdering(Request $request, array $columns): array
    {
        $orders = [];
        foreach ((array) $request->input('order', []) as $order) {
            $idx = (int) data_get($order, 'column', 0);
            $dir = data_get($order, 'dir', 'asc') === 'desc' ? 'desc' : 'asc';
            $col = $columns[$idx] ?? null;
            if ($col) { $orders[] = [$col, $dir]; }
        }
        return $orders;
    }

    /**
     * Safely render a view, returning empty string on error
     */
    protected function safeRenderView(string $view, array $data = []): string
    {
        try {
            return view($view, $data)->render();
        } catch (\Exception $e) {
            Log::error('View render error: ' . $e->getMessage(), ['view' => $view]);
            return '';
        }
    }
}



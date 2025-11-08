<!doctype html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>@yield('title', 'Admin Panel')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" crossorigin="anonymous" media="print" onload="this.media='all'" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/styles/overlayscrollbars.min.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="{{ asset('admin-assets/css/adminlte.css') }}" />
    <!-- DataTables (Bootstrap 5) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/datatables.net-bs5@1.13.10/css/dataTables.bootstrap5.min.css" />
    <style>
    /* Admin DataTable Improvements */
    .card.shadow-sm {
        border: 1px solid #e9ecef;
        border-radius: 8px;
    }
    .card-header.bg-white {
        background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%) !important;
        border-bottom: 2px solid #e9ecef !important;
        padding: 1rem 1.25rem;
    }
    .card-header .card-title {
        color: #2c3e50;
        font-weight: 600;
    }
    .card-body {
        padding: 1.25rem !important;
    }
    /* Filter Design Improvements */
    .filter-group {
        position: relative;
    }
    .filter-select,
    .filter-input {
        border: 1px solid #dee2e6;
        border-radius: 6px;
        transition: all 0.3s ease;
        min-width: 140px;
    }
    .filter-select:focus,
    .filter-input:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        outline: none;
    }
    .filter-select:hover,
    .filter-input:hover {
        border-color: #adb5bd;
    }
    /* DataTable Styling */
    .table-responsive {
        border-radius: 6px;
        overflow: hidden;
    }
    .table thead th {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        font-weight: 600;
        color: #495057;
        border-bottom: 2px solid #dee2e6;
        padding: 0.75rem 1rem;
        text-transform: uppercase;
        font-size: 0.75rem;
        letter-spacing: 0.5px;
    }
    .table tbody td {
        padding: 0.75rem 1rem;
        vertical-align: middle;
    }
    .table tbody tr:hover {
        background-color: #f8f9fa;
    }
    /* DataTables Wrapper */
    .dataTables_wrapper {
        padding-top: 1rem;
    }
    .dataTables_filter input {
        border-radius: 6px;
        border: 1px solid #dee2e6;
        padding: 0.375rem 0.75rem;
        transition: all 0.3s ease;
    }
    .dataTables_filter input:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        outline: none;
    }
    .dataTables_length select {
        border-radius: 6px;
        border: 1px solid #dee2e6;
        padding: 0.375rem 2rem 0.375rem 0.75rem;
    }
    .dataTables_paginate .pagination {
        margin-top: 1rem;
    }
    .dataTables_paginate .page-link {
        border-radius: 6px;
        margin: 0 2px;
        border: 1px solid #dee2e6;
        color: #667eea;
        transition: all 0.2s ease;
    }
    .dataTables_paginate .page-link:hover {
        background: #667eea;
        color: white;
        border-color: #667eea;
        transform: translateY(-2px);
    }
    .dataTables_paginate .page-item.active .page-link {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-color: #667eea;
    }
    /* Button Improvements */
    .btn-sm {
        border-radius: 6px;
        font-weight: 500;
        padding: 0.375rem 0.75rem;
        transition: all 0.2s ease;
    }
    .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
    }
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
    }
    </style>
    @stack('styles')
  </head>
  <body class="layout-fixed sidebar-expand-lg bg-body-tertiary">
    <div class="app-wrapper">
      @include('admin.partials.header')
      @include('admin.partials.sidebar')
      <main class="app-main">
        <div class="app-content">
          <div class="container-fluid py-3">
            @if (session('success'))
              <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @hasSection('breadcrumbs')
              @yield('breadcrumbs')
            @else
              @include('admin.partials.breadcrumb')
            @endif
            @yield('content')
          </div>
        </div>
      </main>
      @include('admin.partials.footer')
    </div>

    <script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.11.0/browser/overlayscrollbars.browser.es6.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="{{ asset('admin-assets/js/adminlte.js') }}"></script>
    <!-- jQuery + DataTables -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/datatables.net@1.13.10/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/datatables.net-bs5@1.13.10/js/dataTables.bootstrap5.min.js"></script>
    @stack('scripts')
  </body>
</html>



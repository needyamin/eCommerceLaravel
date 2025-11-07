@extends('layouts.app')

@section('title', $page->meta_title ?? $page->title)

@if(!empty($page->meta_description))
@section('meta_description', $page->meta_description)
@endif
@if(!empty($page->meta_keywords))
@section('meta_keywords', $page->meta_keywords)
@endif

@section('content')
<div class="container my-5">
    <div class="row">
        <div class="col-lg-10 mx-auto">
            <div class="card shadow-sm">
                <div class="card-header bg-white border-bottom">
                    <h1 class="h3 mb-0">{{ $page->title }}</h1>
                </div>
                <div class="card-body">
                    <div class="page-content">
                        {!! $page->content !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection


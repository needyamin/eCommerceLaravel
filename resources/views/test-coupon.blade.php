@extends('layouts.app')

@section('title', 'Coupon Test')

@section('content')
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5>Coupon Test</h5>
                </div>
                <div class="card-body">
                    <p>Available test coupons:</p>
                    <ul>
                        <li><code>WELCOME10</code> - 10% off (min $50)</li>
                        <li><code>SAVE20</code> - $20 off (min $100)</li>
                        <li><code>FREESHIP</code> - Free shipping</li>
                        <li><code>HOLIDAY25</code> - 25% off (min $75)</li>
                        <li><code>STUDENT15</code> - 15% off (min $30)</li>
                    </ul>
                    
                    <form id="testCouponForm">
                        @csrf
                        <div class="mb-3">
                            <label for="testCode" class="form-label">Coupon Code</label>
                            <input type="text" id="testCode" class="form-control" placeholder="Enter coupon code">
                        </div>
                        <button type="submit" class="btn btn-primary">Test Coupon</button>
                    </form>
                    
                    <div id="testResult" class="mt-3"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('testCouponForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const code = document.getElementById('testCode').value.trim();
    const resultDiv = document.getElementById('testResult');
    
    if (!code) {
        resultDiv.innerHTML = '<div class="alert alert-warning">Please enter a coupon code</div>';
        return;
    }
    
    resultDiv.innerHTML = '<div class="alert alert-info">Testing coupon...</div>';
    
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    
    fetch('{{ route("coupons.apply") }}', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': csrfToken,
            'Accept': 'application/json'
        },
        body: JSON.stringify({ code: code })
    })
    .then(response => {
        console.log('Response status:', response.status);
        return response.json();
    })
    .then(data => {
        console.log('Response data:', data);
        if (data.success) {
            resultDiv.innerHTML = `<div class="alert alert-success">
                <strong>Success!</strong> ${data.message}<br>
                Discount: $${data.coupon.discount}<br>
                Cart Total: $${data.cart.grand_total}
            </div>`;
        } else {
            resultDiv.innerHTML = `<div class="alert alert-danger">
                <strong>Error:</strong> ${data.message}
            </div>`;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        resultDiv.innerHTML = `<div class="alert alert-danger">
            <strong>Network Error:</strong> ${error.message}
        </div>`;
    });
});
</script>
@endsection

document.addEventListener('DOMContentLoaded', function () {
	const cancelButtons = document.querySelectorAll('.momo_left-cancel')

	cancelButtons.forEach(function (cancelButton) {
		cancelButton.addEventListener('click', function () {
			window.location.href = '/account/purchase?order_status=Ch%E1%BB%9D%20thanh%20to%C3%A1n'
		})
	})
})

// Open success modal
setTimeout(() => {
	const successModal = document.querySelector('.success-modal')
	successModal.style.display = 'flex'
	setTimeout(() => {
		successModal.style.display = 'none'
		window.location.href = '/account/purchase?order_status=Đang%20giao%20hàng'
	}, 1000)
}, 5000)
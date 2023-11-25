const inputs = document.querySelectorAll('.purchase-item__product-detail input');

inputs.forEach(function (input) {
    // Lưu trạng thái ban đầu của mỗi input
    const originalColor = getComputedStyle(input).color;
    const originalHrDisplay = getComputedStyle(input.nextElementSibling).display;

    input.addEventListener('focus', function () {
        // Ẩn hr và đổi màu chữ thành đen khi input được focus
        input.nextElementSibling.style.opacity = '0';
        input.style.color = 'black';
    });

    input.addEventListener('blur', function () {
        // Khôi phục trạng thái ban đầu khi input mất focus
        input.nextElementSibling.style.display = originalHrDisplay;
        input.style.color = originalColor;
    });
});
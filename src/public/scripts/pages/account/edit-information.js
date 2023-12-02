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

function checkUserName() {
    const userNameInput = document.getElementById('userName');
    const userNameError = document.getElementById('userNameError');

    if (!isValidName(userNameInput.value)) {
        userNameError.textContent = 'Tên không thể chứa số hoặc các kí tự đặc biệt';
        userNameError.style.color = 'red';
    } else {
        userNameError.textContent = '';
    }
}

function checkUserEmail() {
    const userEmailInput = document.getElementById('userEmail');
    const userEmailError = document.getElementById('userEmailError');

    if (!isValidEmail(userEmailInput.value)) {
        userEmailError.textContent = 'Sai định dạng email';
        userEmailError.style.color = 'red';
    } else {
        userEmailError.textContent = '';
    }
}

function checkUserPhone() {
    const userPhoneInput = document.getElementById('userPhone');
    const userPhoneError = document.getElementById('userPhoneError');

    if (!isValidPhone(userPhoneInput.value)) {
        userPhoneError.textContent = 'Sai định dạng số điện thoại';
        userPhoneError.style.color = 'red';
    } else {
        userPhoneError.textContent = '';
    }
}

function isValidName(name) {
    return /^[a-zA-Z\s]+$/.test(name);
}

function isValidEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function isValidPhone(phone) {
    return /^\d{10}$/.test(phone);
}
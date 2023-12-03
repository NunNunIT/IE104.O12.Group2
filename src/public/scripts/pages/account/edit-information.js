const inputs = document.querySelectorAll('.purchase-item__product-detail input');

// 
const form = document.getElementById('editForm');
const userName = document.getElementById('userName');
const userEmail = document.getElementById('userEmail');
const userPhone = document.getElementById('userPhone');

form.addEventListener('submit', e => {
    e.preventDefault();
    validateInput();
});

const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error-message');

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('error');
};

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error-message');

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
};

const isValidPhoneNumber = phoneNumber => {
    const re = /^[0-9]{10}$/;
    return re.test(String(phoneNumber).trim());
};

const isValidEmail = email => {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(String(email).toLowerCase());
};

const validateInput = () => {
    const userNameValue = userName.value.trim();
    const userEmailValue = userEmail.value.trim();
    const userPhoneValue = userPhone.value.trim();

    let isAllValid = true;

    if (userNameValue === '') {
        setError(userName, 'Vui lòng nhập họ tên!');
        isAllValid = false;
    } else {
        setSuccess(userName);
    }

    if (userEmailValue === '') {
        setError(userEmail, 'Vui lòng nhập email!');
        isAllValid = false;
    } else if (!isValidEmail(userEmailValue)) {
        setError(userEmail, 'Email không đúng định dạng!');
        isAllValid = false;
    } else {
        setSuccess(userEmail);
    }

    if (userPhoneValue === '') {
        setError(userPhone, 'Vui lòng nhập số điện thoại!');
        isAllValid = false;
    } else if (!isValidPhoneNumber(userPhoneValue)) {
        setError(userPhone, 'Số điện thoại không đúng định dạng!');
        isAllValid = false;
    } else {
        setSuccess(userPhone);
    }

    // Nếu tất cả các trường thông tin hợp lệ, thì gửi form
    if (isAllValid) {
        const form = {
            user_name: userName.value.trim(),
            user_email: userEmail.value.trim(),
            user_phone: userPhone.value.trim()
        };

        fetch("/account/information", {
                method: "POST",
                body: JSON.stringify(register),
                headers: {
                    "Content-Type": "application/json"
                }
            }).then(res => res.json())
            .then(back => {
                if (back.status == "error") {
                    setError(phoneNumber, back.error);
                } else {
                    const login = {
                        phoneNumber: phoneNumber.value.trim(),
                        password: password.value.trim()
                    }

                    fetch('/auth/login', {
                        method: 'POST',
                        body: JSON.stringify(login),
                        headers: {
                            "Content-Type": "application/json"
                        }
                    })
                    
                    history.back();
                    location.reload()
                }
            })
    }
};

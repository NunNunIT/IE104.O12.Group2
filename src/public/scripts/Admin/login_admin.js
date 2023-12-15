const inputs = document.querySelectorAll(".login__input-field");
const toggle_btn = document.querySelectorAll(".login__toggle");
const main = document.querySelector("main");

inputs.forEach((inp) => {
    inp.addEventListener("focus", () => {
        inp.classList.add("active");
    });
    inp.addEventListener("blur", () => {
        if (inp.value != "") return;
        inp.classList.remove("active");
    });
});

const passwordInput = document.getElementById("password");
const togglePasswordButton = document.getElementById("togglePassword");

togglePasswordButton.addEventListener("click", function () {
    const isVisible = togglePasswordButton.getAttribute("data-visible") === "true";

    if (isVisible) {
        passwordInput.type = "Password"; // Ẩn mật khẩu
        togglePasswordButton.setAttribute("data-visible", "false");
        togglePasswordButton.querySelector(".material-symbols-outlined").textContent = "visibility";
    } else {
        passwordInput.type = "text"; // Hiển thị mật khẩu
        togglePasswordButton.setAttribute("data-visible", "true");
        togglePasswordButton.querySelector(".material-symbols-outlined").textContent = "visibility_off";
    }
});

const form = document.getElementById('form');
const adminLogin = document.getElementById('adminLogin');
const password = document.getElementById('password');

form.addEventListener('submit', e => {
    e.preventDefault();

    validateInput();
});


const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(`.login__error`);

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('error');
}

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(`.login__error`);

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
}

const validateInput = () => {

    const adminLoginValue = adminLogin.value.trim();
    const passwordValue = password.value.trim();

    let isAllValid = true;

    if (adminLoginValue === '') {
        setError(adminLogin, 'Vui lòng nhập tên đăng nhập!');
        isAllValid = false;
    } else if (adminLoginValue.length != 8) {
        setError(adminLogin, 'Tên đăng nhập không đúng định dạng!')
        isAllValid = false;
    } else {
        setSuccess(adminLogin);
    }

    if (passwordValue === '') {
        setError(password, 'Vui lòng nhập mật khẩu!');
        isAllValid = false;
    } else if (passwordValue.length < 8) {
        setError(password, 'Mật khẩu phải ít nhất 8 ký tự!')
        isAllValid = false;
    } else {
        setSuccess(password);
    }


    if (isAllValid) {
        const login = {
            adminLogin: adminLogin.value.trim(),
            password: password.value.trim()
        }
        fetch("/admin/login", {
            method: 'POST',
            body: JSON.stringify(login),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(res => res.json()).then(back => {
            if (back.status == "error") {
                setError(adminLogin, back.error);
            }
            else if (back.status == "error2") {
                setError(password, back.error);
            }
            else {
                window.location.href = '/admin/'
            }

        })
    }

};

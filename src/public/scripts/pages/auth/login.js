const inputs = document.querySelectorAll(".login__input-field");
const toggle_btn = document.querySelectorAll(".login__toggle");
const main = document.querySelector("main");
const bullets = document.querySelectorAll(".login__bullets span");
const images = document.querySelectorAll(".login__image");

inputs.forEach((inp) => {
    inp.addEventListener("focus", () => {
        inp.classList.add("active");
    });
    inp.addEventListener("blur", () => {
        if (inp.value != "") return;
        inp.classList.remove("active");
    });
});

function moveSlider() {
    let index = 1;

    function transitionSlide() {
        let currentImage = document.querySelector(`.login__img-${index}`);
        images.forEach((img) => img.classList.remove("show"));
        currentImage.classList.add("show");

        bullets.forEach((bull) => bull.classList.remove("active"));
        bullets[index - 1].classList.add("active");

        index = (index % images.length) + 1;
    }

    return transitionSlide;
}

const autoSlide = moveSlider();

function startAutoSlide() {
    autoSlide();
    setTimeout(startAutoSlide, 3000); //tự động chuyển slide mỗi 3 giây
}

startAutoSlide();

bullets.forEach((bullet) => {
    bullet.addEventListener("click", () => {
        // Dừng tự động chuyển slide khi người dùng chọn slide thủ công
        clearTimeout(autoSlide);

        // Xác định slide cần hiển thị dựa trên data-value của bullet
        const index = parseInt(bullet.getAttribute("data-value"));
        let currentImage = document.querySelector(`.login__img-${index}`);

        // Hiển thị slide tương ứng
        images.forEach((img) => img.classList.remove("show"));
        currentImage.classList.add("show");

        // Đánh dấu bullet tương ứng là active
        bullets.forEach((bull) => bull.classList.remove("active"));
        bullet.classList.add("active");

        // Khởi động lại tự động chuyển slide sau khi người dùng đã chọn slide
        autoSlideInterval = setInterval(moveSlider, 2000);
    });
});


const passwordInput = document.getElementById("Password");
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
const PhoneNumber = document.getElementById('PhoneNumber');
const Password = document.getElementById('Password');


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

const isValidPhoneNumber = PhoneNumber => {
    const re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
    return re.test(String(PhoneNumber).trim());
}

const validateInput = () => {

    const PhoneNumberValue = PhoneNumber.value.trim();
    const PasswordValue = Password.value.trim();

    let isAllValid = true;



    if (PhoneNumberValue === '') {
        setError(PhoneNumber, 'Vui lòng nhập số điện thoại!');
        isAllValid = false;
    } else if (!isValidPhoneNumber(PhoneNumberValue)) {
        setError(PhoneNumber, 'Số điện thoại không đúng định dạng!')
        isAllValid = false;
    } else {
        setSuccess(PhoneNumber);
    }

    if (PasswordValue === '') {
        setError(Password, 'Vui lòng nhập mật khẩu!');
        isAllValid = false;
    } else if (PasswordValue.length < 8) {
        setError(Password, 'Mật khẩu phải ít nhất 8 ký tự!')
        isAllValid = false;
    } else {
        setSuccess(Password);
    }


    if (isAllValid) {
        const login = {
            user_phone: PhoneNumber.value.trim(),
            user_password: Password.value.trim()
        }
        fetch("/login", {
            method: 'POST',
            body: JSON.stringify(login),
            headers: {
                "Content-Type": "application/json"
            }
        }).then (res => res.json()).then (data => {
            if (data.status == "error"){
                setError(PhoneNumber, data.error);
            }
            else if (data.status == "error2") {
                setError(Password, data.error);
            }
    
        })
    }
    
};

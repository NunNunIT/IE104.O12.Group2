const inputs = document.querySelectorAll(".forgot__input-field");
const toggle_btn = document.querySelectorAll(".forgot__toggle");
const main = document.querySelector("main");

autoComplete();
function autoComplete() {
  inputs.forEach((inp) => {
    if (inp.value) {
      inp.classList.add("active");
    }
  });
}

inputs.forEach((inp) => {
  inp.addEventListener("focus", () => {
    inp.classList.add("active");
  });
  inp.addEventListener("blur", () => {
    if (inp.value != "") return;
    inp.classList.remove("active");
  });
});

const form = document.getElementById("form");
const PhoneNumber = document.getElementById("PhoneNumber");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  validateInput();
});

const setError = (element, message) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`.forgot__error`);

  errorDisplay.innerText = message;
  inputControl.classList.add("error");
  inputControl.classList.remove("error");
};

const setSuccess = (element) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`.forgot__error`);

  errorDisplay.innerText = "";
  inputControl.classList.add("success");
  inputControl.classList.remove("error");
};

const isValidPhoneNumber = (PhoneNumber) => {
  const re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
  return re.test(String(PhoneNumber).trim());
};

const validateInput = () => {
  const PhoneNumberValue = PhoneNumber.value.trim();

  let isAllValid = true;

  if (PhoneNumberValue === "") {
    setError(PhoneNumber, "Vui lòng nhập số điện thoại!");
    isAllValid = false;
  } else if (!isValidPhoneNumber(PhoneNumberValue)) {
    setError(PhoneNumber, "Số điện thoại không đúng định dạng!");
    isAllValid = false;
  } else {
    setSuccess(PhoneNumber);
  }

  if (isAllValid) {
    const forgot = {
      user_phone: PhoneNumber.value.trim(),
    };
    console.log(forgot);
    fetch("/auth/findUser", {
      method: "POST",
      body: JSON.stringify(forgot),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then((back) => {
        console.log(back);
        if (back.status == "notFound") {
          setError(PhoneNumber, back.error);
        } else if (back.status == "success") {
          showStep2();
        }
      });
  }
};

const showStep2 = () => {
  document.querySelector(".Step1").style.display = "none";
  document.querySelector(".Step2").style.display = "block";
  document.querySelector(".forgot__sign-in-form").style.display = "none";
  function updateCountdown() {
    const countdownElement = document.getElementById("countdown");
    const now = new Date();
    const targetTime = new Date(now.getTime() + 45 * 1000); // 30 seconds from now

    const timeDifference = targetTime - now;
    const seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);

    countdownElement.textContent = `Thời gian xác nhận: ${seconds}s`;

    if (timeDifference <= 0) {
      countdownElement.textContent = "Hết thời gian xác nhận!";
    }

    // Tự động cập nhật mỗi giây
    setTimeout(updateCountdown, 1000);
  }
  updateCountdown();
};

// Lắng nghe sự kiện input trên các ô nhập OTP
const otpInputs = document.querySelectorAll(
  '.actual-form input[type="number"]'
);
otpInputs.forEach((input) => {
  input.addEventListener("input", function () {
    // Lọc bỏ các ký tự không phải số
    const inputValue = this.value.replace(/[^0-9]/g, "");

    // Giới hạn chiều dài của giá trị nhập vào
    const maxLength = parseInt(this.getAttribute("maxlength"));
    const truncatedValue = inputValue.slice(0, maxLength);

    // Cập nhật giá trị của ô nhập
    this.value = truncatedValue;

    // Chuyển focus đến ô tiếp theo (nếu có) nếu ô hiện tại đã đủ chiều dài
    if (truncatedValue.length === maxLength) {
      moveToNext(this);
    }
  });
});

// Hàm di chuyển focus đến ô tiếp theo
const moveToNext = (currentInput, nextInputId) => {
  const nextInput = document.getElementById(
    nextInputId || currentInput.getAttribute("data-next-input")
  );
  if (nextInput) {
    nextInput.focus();
  }
};

// Lắng nghe sự kiện focus trên các ô nhập OTP
otpInputs.forEach((input) => {
  input.addEventListener("focus", function () {
    // Lưu giá trị hiện tại khi ô được chọn
    this.dataset.previousValue = this.value;
  });

  input.addEventListener("input", function () {
    const inputValue = this.value.replace(/[^0-9]/g, "");
    const maxLength = parseInt(this.getAttribute("maxlength"));
    const truncatedValue = inputValue.slice(0, maxLength);

    // Nếu ô đã có giá trị và giá trị mới khác với giá trị trước đó, cập nhật giá trị
    if (
      this.dataset.previousValue &&
      this.dataset.previousValue !== truncatedValue
    ) {
      this.value = truncatedValue;
    }

    // Lưu giá trị hiện tại
    this.dataset.previousValue = truncatedValue;

    if (truncatedValue.length === maxLength) {
      moveToNext(this);
    }
  });
});

document
  .getElementById("resendLink")
  .addEventListener("click", function (event) {
    event.preventDefault();

    const statusSpan = document.querySelector(".send-again span");

    // Sử dụng gsap để tạo hiệu ứng fadeOut cho cả span và nút Gửi lại mã OTP
    gsap.to([statusSpan, "#resendLink"], {
      opacity: 0,
      duration: 0.5,
      onComplete: function () {
        // Thay đổi nội dung của span
        statusSpan.textContent = "Đã gửi lại mã OTP";
        statusSpan.classList.add("centered-text");

        // Sử dụng gsap để tạo hiệu ứng fadeIn cho cả span và nút Gửi lại mã OTP
        gsap.to([statusSpan], { opacity: 1, duration: 0.5 });

        // Đặt thời gian để hiển thị lại nút Gửi lại mã OTP sau 5 giây
        setTimeout(function () {
          // Sử dụng gsap để tạo hiệu ứng fadeOut cho cả span và nút Gửi lại mã OTP
          gsap.to([statusSpan], {
            opacity: 0,
            duration: 0.5,
            onComplete: function () {
              // Cập nhật nội dung của span về trạng thái bình thường
              statusSpan.textContent = "Bạn không nhận được mã OTP?";
              statusSpan.classList.remove("centered-text");
              // Sử dụng gsap để tạo hiệu ứng fadeIn cho cả span và nút Gửi lại mã OTP
              gsap.to([statusSpan, "#resendLink"], {
                opacity: 1,
                duration: 0.5,
              });
            },
          });
        }, 5000);
      },
    });
  });

const form_otp = document.getElementById("form_otp");
form_otp.addEventListener("submit", (e) => {
  e.preventDefault();
  window.location.href = "/auth/reset";
});

// Thêm "active" vào side-menu__ele 
const appbar__element = document.querySelectorAll('.side-menu__ele');
appbar__element[3].classList.add('active');

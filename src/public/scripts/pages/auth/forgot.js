const inputs = document.querySelectorAll(".forgot__input-field");
// const toggle_btn = document.querySelectorAll(".forgot__toggle");
// const main = document.querySelector("main");

inputs.forEach((inp) => {
	inp.addEventListener("focus", () => {
		inp.classList.add("active");
	});
	inp.addEventListener("blur", () => {
		if (inp.value != "") return;
		inp.classList.remove("active");
	});
});

const resetInputs = document.querySelectorAll(".reset__input-field");

resetInputs.forEach((inp) => {
  inp.addEventListener("focus", () => {
    inp.classList.add("active");
  });
  inp.addEventListener("blur", () => {
    if (inp.value != "") return;
    inp.classList.remove("active");
  });
});

const passwordInput = document.getElementById("Password");
const confirmPasswordInput = document.getElementById("ConfirmPassword");
const togglePasswordButton = document.getElementById("togglePassword");
const toggleConfirmPasswordButton = document.getElementById(
  "toggleConfirmPassword"
);

togglePasswordButton.addEventListener("click", function () {
  const isVisible =
    togglePasswordButton.getAttribute("data-visible") === "true";

  if (isVisible) {
    passwordInput.type = "password";
    togglePasswordButton.setAttribute("data-visible", "false");
    togglePasswordButton.querySelector(
      ".material-symbols-outlined"
    ).textContent = "visibility";
  } else {
    passwordInput.type = "text"; // Hiển thị mật khẩu
    togglePasswordButton.setAttribute("data-visible", "true");
    togglePasswordButton.querySelector(
      ".material-symbols-outlined"
    ).textContent = "visibility_off";
  }
});

toggleConfirmPasswordButton.addEventListener("click", function () {
  const isVisible =
    toggleConfirmPasswordButton.getAttribute("data-visible") === "true";

  if (isVisible) {
    confirmPasswordInput.type = "password"; // Ẩn mật khẩu
    toggleConfirmPasswordButton.setAttribute("data-visible", "false");
    toggleConfirmPasswordButton.querySelector(
      ".material-symbols-outlined"
    ).textContent = "visibility";
  } else {
    confirmPasswordInput.type = "text";
    toggleConfirmPasswordButton.setAttribute("data-visible", "true");
    toggleConfirmPasswordButton.querySelector(
      ".material-symbols-outlined"
    ).textContent = "visibility_off";
  }
});

const resetForm = document.getElementById("form_reset");
const form = document.getElementById("form");
const PhoneNumber = document.getElementById("PhoneNumber");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  validateInputPhone();
});

const formOTP = document.getElementById("form_otp");
formOTP.addEventListener("submit", (e) => {
  e.preventDefault();
  if (validateInputOTP()){
    document.querySelector("#form_otp").style.display = "none";
    document.querySelector(".Step3").style.display = "block";
  }
});

resetForm.addEventListener("submit", (e) => {
  e.preventDefault();
  validateInputPass();
});

const setError = (element, message) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`.error`);

	errorDisplay.innerText = message;
	inputControl.classList.add("error");
	inputControl.classList.remove("error");
};

const setSuccess = (element) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`.error`);

	errorDisplay.innerText = "";
	inputControl.classList.add("success");
	inputControl.classList.remove("error");
};

const isValidPhoneNumber = (PhoneNumber) => {
	const re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
	return re.test(String(PhoneNumber).trim());
};

const validateInputPhone = () => {
  const PhoneNumberValue = PhoneNumber.value.trim();

  let isPhoneValid = true;

  if (PhoneNumberValue === "") {
    setError(PhoneNumber, "Vui lòng nhập số điện thoại!");
    isPhoneValid = false;
  } else if (!isValidPhoneNumber(PhoneNumberValue)) {
    setError(PhoneNumber, "Số điện thoại không đúng định dạng!");
    isPhoneValid = false;
  } else {
    setSuccess(PhoneNumber);
  }

  if (isPhoneValid) {
    const forgot = {
      user_phone: PhoneNumber.value.trim(),
    };
    fetch("/auth/findUser", {
      method: "POST",
      body: JSON.stringify(forgot),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then((back) => {
        if (back.status == "notFound") {
          setError(PhoneNumber, back.error);
        } else if (back.status == "success") {
          showStep2();
        }
      });
  }
};

const validateInputOTP = () => {
  const otpInputs = formOTP.querySelectorAll('input[name=otp]')

  let isAllOTPValid = true;

  otpInputs.forEach((otpInput) => {
    if (otpInput.value == ""){
      isAllOTPValid = false;
      otpInput.style.borderColor = "red"
    } else {
      otpInput.style.borderColor = "#ccc"
    }
  })

  return isAllOTPValid
};

const validateInputPass = async () => {
  const PasswordValue = Password.value.trim();
  const confirmPasswordValue = confirmPasswordInput.value.trim();

  let isAllValidPass = true;

  if (PasswordValue === "") {
    setError(Password, "Vui lòng nhập mật khẩu!");
    isAllValidPass = false;
  } else if (PasswordValue.length < 8) {
    setError(Password, "Mật khẩu phải ít nhất 8 ký tự!");
    isAllValidPass = false;
  } else {
    setSuccess(Password, "Hợp lệ");
  }

  // Validate confirm password
  if (confirmPasswordValue === "") {
    setError(confirmPasswordInput, "Vui lòng xác nhận mật khẩu!");
    isAllValidPass = false;
  } else if (confirmPasswordValue !== PasswordValue) {
    setError(confirmPasswordInput, "Mật khẩu xác nhận không khớp!");
    isAllValidPass = false;
  } else {
    setSuccess(confirmPasswordInput, "Hợp lệ");
  }

  if (isAllValidPass) {
    const reset = {
      user_password: PasswordValue,
      user_phone: PhoneNumber.value.trim(),
    };
    await fetch("/auth/reset", {
      method: "POST",
      body: JSON.stringify(reset),
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then((back) => {
        if (back.status == "error") {
          setError(Password, back.error)
        } else if (back.status == "success") {
          window.location.href = '/auth/login';
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

const resendLinkBtn = document.getElementById("resendLink")
console.log(resendLinkBtn);

resendLinkBtn.addEventListener("click", function (event) {
  event.preventDefault();

  const statusSpan = document.querySelector(".send-again span");

  clearOTPValues()
  fadeOut(statusSpan, resendLinkBtn, 500, function () {
      statusSpan.textContent = "Đã gửi lại mã OTP";
      statusSpan.classList.add("centered-text");

      fadeInOne(statusSpan, 500);

      setTimeout(function () {
          fadeOut(statusSpan, resendLinkBtn, 500, function () {
              statusSpan.textContent = "Bạn không nhận được mã OTP?";
              statusSpan.classList.remove("centered-text");
              fadeInTwo(statusSpan, resendLinkBtn, 500);
          });
      }, 5000);
  });
});

function clearOTPValues() {
  // Lặp qua tất cả các ô OTP và xóa giá trị của chúng
  for (let i = 1; i <= 6; i++) {
      const otpInput = document.getElementById(`otp${i}`);
      if (otpInput) {
          otpInput.value = "";
      }
  }
}

function fadeInTwo(element, element, duration, callback) {
  element.style.transition = `opacity ${duration}ms`;
  element.style.opacity = 1;

  // Set a timeout to clear the transition property after the fade in is complete
  setTimeout(function () {
      element.style.transition = "";
      callback && callback(); // Call the callback function if provided
  }, duration);
}

function fadeInOne(element, duration, callback) {
  element.style.transition = `opacity ${duration}ms`;
  element.style.opacity = 1;

  // Set a timeout to clear the transition property after the fade in is complete
  setTimeout(function () {
      element.style.transition = "";
      callback && callback(); // Call the callback function if provided
  }, duration);
}

function fadeOut(element, element, duration, callback) {
  element.style.transition = `opacity ${duration}ms`;
  element.style.opacity = 0;

  // Set a timeout to clear the transition property after the fade out is complete
  setTimeout(function () {
      element.style.transition = "";
      callback && callback(); // Call the callback function if provided
  }, duration);
}

step3_valid = function () {};

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
const Password = document.getElementById("Password");

resetForm.addEventListener("submit", (e) => {
	e.preventDefault();
	validateInput();
});

const resetError = (element, message) => {
	const inputControlReset = element.parentElement;
	const errorDisplayReset = inputControlReset.querySelector(`.reset__error`);

	errorDisplayReset.innerText = message;
	inputControlReset.classList.add("error");
	inputControlReset.classList.remove("error");
};

const resetSuccess = (element) => {
	const inputControlReset = element.parentElement;
	const errorDisplayReset = inputControlReset.querySelector(`.reset__error`);

	errorDisplayReset.innerText = "";
	inputControlReset.classList.add("success");
	inputControlReset.classList.remove("error");
};

const resetValidateInput = () => {
	const PasswordValue = Password.value.trim();
	const confirmPasswordValue = confirmPasswordInput.value.trim();

	let isAllValid = true;

	if (PasswordValue === "") {
		resetError(Password, "Vui lòng nhập mật khẩu!");
		isAllValid = false;
	} else if (PasswordValue.length < 8) {
		resetError(Password, "Mật khẩu phải ít nhất 8 ký tự!");
		isAllValid = false;
	} else {
		resetSuccess(Password, "Hợp lệ");
	}

	// Validate confirm password
	if (confirmPasswordValue === "") {
		resetError(confirmPasswordInput, "Vui lòng xác nhận mật khẩu!");
		isAllValid = false;
	} else if (confirmPasswordValue !== PasswordValue) {
		resetError(confirmPasswordInput, "Mật khẩu xác nhận không khớp!");
		isAllValid = false;
	} else {
		resetSuccess(confirmPasswordInput, "Hợp lệ");
	}

	if (isAllValid) {
		const reset = {
			user_password: Password.value.trim(),
		};
		fetch("/auth/login", {
			method: "POST",
			body: JSON.stringify(reset),
			headers: {
				"Content-Type": "application/json",
			},
		})
			.then((res) => res.json())
			.then((back) => {
				if (back.status == "error2") {
					resetError(Password, back.error);
				} else {
					resetForm.submit();
				}
			});
	}
};

const inputs = document.querySelectorAll(".reset__input-field");
const toggle_btn = document.querySelectorAll(".reset__toggle");
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

const form = document.getElementById("form");
const Password = document.getElementById("Password");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  validateInput();
});

const setError = (element, message) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`.reset__error`);

  errorDisplay.innerText = message;
  inputControl.classList.add("error");
  inputControl.classList.remove("error");
};

const setSuccess = (element) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`.reset__error`);

  errorDisplay.innerText = "";
  inputControl.classList.add("success");
  inputControl.classList.remove("error");
};

const validateInput = () => {
  const PasswordValue = Password.value.trim();
  const confirmPasswordValue = confirmPasswordInput.value.trim();

  let isAllValid = true;

  if (PasswordValue === "") {
    setError(Password, "Vui lòng nhập mật khẩu!");
    isAllValid = false;
  } else if (PasswordValue.length < 8) {
    setError(Password, "Mật khẩu phải ít nhất 8 ký tự!");
    isAllValid = false;
  } else {
    setSuccess(Password, "Hợp lệ");
  }

  // Validate confirm password
  if (confirmPasswordValue === "") {
    setError(confirmPasswordInput, "Vui lòng xác nhận mật khẩu!");
    isAllValid = false;
  } else if (confirmPasswordValue !== PasswordValue) {
    setError(confirmPasswordInput, "Mật khẩu xác nhận không khớp!");
    isAllValid = false;
  } else {
    setSuccess(confirmPasswordInput, "Hợp lệ");
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
          setError(Password, back.error);
        } else {
          form.submit();
        }
      });
  }
};

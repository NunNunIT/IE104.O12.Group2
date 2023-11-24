//Popup
const modalBtns = document.querySelectorAll('.btn-warranty')
const modals = document.querySelectorAll('.popup')
const closeBtns = document.querySelectorAll('.close-btn')
const cancelBtns = document.querySelectorAll('.btn-cancel')

modalBtns.forEach((btn) => {
    btn.onclick = function () {
        modals[0].style.display = 'block'
    }
})

// Đóng popup khi chọn dấu x
closeBtns.forEach((closeBtn) => {
    closeBtn.onclick = function () {
        modals[0].style.display = 'none'
    }
})

// Đóng popup khi chọn nút hủy
cancelBtns.forEach((cancelBtn) => {
    cancelBtn.onclick = function () {
        modals[0].style.display = 'none'
    }
})

// Đóng popup khi nhấp chuột vào bất kỳ khu vực nào trên màn hình
window.onclick = function (e) {
    modals.forEach((modal) => {
        if (e.target == modal) {
            modal.style.display = 'none'
        }
    })
}















const form = document.getElementById("form");
const Password = document.getElementById("Password");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  validateInput();
  validateRequiredFields();
});

const setError = (element, message) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`reset__error`);

  errorDisplay.innerText = message;
  inputControl.classList.add("error");
  inputControl.classList.remove("success");
};

const setSuccess = (element) => {
  const inputControl = element.parentElement;
  const errorDisplay = inputControl.querySelector(`reset__error`);

  errorDisplay.innerText = "";
  inputControl.classList.add("success");
  inputControl.classList.remove("error");
};

const validateRequiredFields = () => {
  const requiredFields = document.querySelectorAll(".required");

  requiredFields.forEach((field) => {
    const inputElement = field.parentElement.querySelector("input, textarea");
    const inputValue = inputElement.value.trim();

    if (inputValue === "") {
      setError(inputElement, "Trường này là bắt buộc!");
    } else {
      setSuccess(inputElement);
    }
  });
};

const validateInput = () => {
    const PasswordValue = Password.value.trim();
  
    let isAllValid = true;
  
    if (PasswordValue === "") {
      setError(Password, "Vui lòng nhập thông tin!");
      isAllValid = false;
    } else {
      setSuccess(Password, "Hợp lệ");
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
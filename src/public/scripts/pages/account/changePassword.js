// Thêm "active" vào side-menu__ele 
const appbar__element = document.querySelectorAll('.side-menu__ele');
appbar__element[3].classList.add('active');

document.addEventListener('DOMContentLoaded', function () {
	const logoutButton = document.querySelector('#logout-btn');
	const popup = document.querySelector('#logout-popup');
	const confirmButton = document.querySelector('#confirm-button');
	const cancelButton = document.querySelector('#cancel-button');

	logoutButton.addEventListener('click', function () {
		// Hiển thị popup form đăng xuất
		popup.style.display = 'block';
	});

	cancelButton.addEventListener('click', function () {
		// Hiển thị lại thông tin cá nhân khi click vào nút "Hủy" trong popup
		document.getElementById('info').style.display = 'block';
		// Ẩn popup form đăng xuất
		popup.style.display = 'none';
	});

	confirmButton.addEventListener('click', function () {
		// Thêm mã xử lý khi người dùng xác nhận đăng xuất
		// Ví dụ: window.location.href = 'logout.php';
	});
});

// Lắng nghe sự kiện click trên phần tử có class "popup"
document.querySelector('.popup').addEventListener('click', function (event) {
	// Kiểm tra nếu phần tử được click không thuộc về phần tử con của logout-form
	if (!event.target.closest('.logout-form')) {
		// Đóng popup
		closeLogoutPopup();
	}
});

// Các hàm khác không thay đổi
function openLogoutPopup() {
	var logoutPopup = document.getElementById('logout-popup');
	logoutPopup.style.display = 'block';
}

function closeLogoutPopup() {
	var logoutPopup = document.getElementById('logout-popup');
	logoutPopup.style.display = 'none';
}

function confirmLogout() {
	closeLogoutPopup();
}

// Sự kiện nhấn nút "Đăng xuất"
document.getElementById('confirm-button').addEventListener('click', confirmLogout);


document.addEventListener('DOMContentLoaded', function () {
	const editInfoLink = document.querySelector('p.purchase-item__status a');

	editInfoLink.addEventListener('click', function (event) {
		event.preventDefault(); // Ngăn chặn hành động mặc định của thẻ <a>

		// Tìm phần tử có class "purchase-item__product-detail"
		const productDetail = document.querySelector('.purchase-item__product-detail');
		// Tìm phần tử có class "change_Password"
		const changePassword = document.querySelector('.change_Password');

		// Ẩn phần tử "purchase-item__product-detail"
		productDetail.style.display = 'none';
		// Hiển thị phần tử "change_Password"
		changePassword.style.display = 'block';
		editInfoLink.style.display = 'none';
	});
});


document.addEventListener('DOMContentLoaded', function () {
	const cancelButton = document.querySelector('.btn-cancel');

	cancelButton.addEventListener('click', function (event) {
		event.preventDefault(); // Ngăn chặn hành động mặc định của nút

		// Tìm phần tử có class "purchase-item__product-detail"
		const productDetail = document.querySelector('.purchase-item__product-detail');
		// Tìm phần tử có class "change_Password"
		const changePassword = document.querySelector('.change_Password');

		// Hiển thị phần tử "purchase-item__product-detail"
		productDetail.style.display = 'block';
		// Ẩn phần tử "change_Password"
		changePassword.style.display = 'none';
	});
});



















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
const oldPasswordInput = document.getElementById("oldPassword");
const confirmPasswordInput = document.getElementById("confirmPassword");
const togglePasswordButton = document.getElementById("togglePassword");
const toggleoldPasswordButton = document.getElementById("toggleoldPassword");
const toggleconfirmPasswordButton = document.getElementById("toggleconfirmPassword");

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

toggleoldPasswordButton.addEventListener("click", function () {
	const isVisible =
		toggleoldPasswordButton.getAttribute("data-visible") === "true";

	if (isVisible) {
		oldPasswordInput.type = "password";
		toggleoldPasswordButton.setAttribute("data-visible", "false");
		toggleoldPasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility";
	} else {
		oldPasswordInput.type = "text"; // Hiển thị mật khẩu
		toggleoldPasswordButton.setAttribute("data-visible", "true");
		toggleoldPasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility_off";
	}
});

toggleconfirmPasswordButton.addEventListener("click", function () {
	const isVisible =
		toggleconfirmPasswordButton.getAttribute("data-visible") === "true";

	if (isVisible) {
		confirmPasswordInput.type = "password"; // Ẩn mật khẩu
		toggleconfirmPasswordButton.setAttribute("data-visible", "false");
		toggleconfirmPasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility";
	} else {
		confirmPasswordInput.type = "text";
		toggleconfirmPasswordButton.setAttribute("data-visible", "true");
		toggleconfirmPasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility_off";
	}
});

const form = document.getElementById("form");
const Password = document.getElementById("Password");
const confirmPassword = document.getElementById("confirmPassword");
const oldPassword = document.getElementById("oldPassword");

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
	const oldPasswordValue = oldPassword.value.trim();
	const confirmPasswordValue = confirmPassword.value.trim();
	const PasswordValue = Password.value.trim();

	let isAllValid = true;

	if (oldPasswordValue === "") {
		setError(oldPassword, "Vui lòng nhập mật khẩu!");
		isAllValid = false;
	} else if (oldPasswordValue.length < 8) {
		setError(oldPassword, "Mật khẩu phải ít nhất 8 ký tự!");
		isAllValid = false;
	} else {
		setSuccess(oldPassword, "Hợp lệ");
	}

	// Validate confirm password
	if (confirmPasswordValue === "") {
		setError(confirmPassword, "Vui lòng xác nhận mật khẩu!");
		isAllValid = false;
	} else if (confirmPasswordValue !== PasswordValue) {
		setError(confirmPassword, "Mật khẩu xác nhận không khớp!");
		isAllValid = false;
	} else {
		setSuccess(confirmPassword, "Hợp lệ");
	}


	if (PasswordValue === "") {
		setError(Password, "Vui lòng nhập mật khẩu!");
		isAllValid = false;
	} else if (PasswordValue.length < 8) {
		setError(Password, "Mật khẩu phải ít nhất 8 ký tự!");
		isAllValid = false;
	} else {
		setSuccess(Password, "Hợp lệ");
	}

	if (isAllValid) {
		const reset = {
			user_password: oldPassword.value.trim(),
		};
		fetch("/account/checkUser", {
			method: "POST",
			body: JSON.stringify(reset),
			headers: {
				"Content-Type": "application/json",
			},
		})
			.then((res) => res.json())
			.then((back) => {
				if (back.status == "error") {
					setError(oldPassword, back.error);
				} else if (back.status == "wrongPassword") {
					setError(oldPassword, back.error);
				} else {
					form.submit();
				}
			});
	}
};
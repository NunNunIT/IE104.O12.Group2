const appbar__element = document.querySelectorAll('.side-menu__ele');
appbar__element[3].classList.add('active');
const appbarEle = document.querySelectorAll('.app-bar__element')
appbarEle[3].classList.add('active')

const inputs = document.querySelectorAll(".reset__input-field");
const toggle_btn = document.querySelectorAll(".reset__toggle");

inputs.forEach((inp) => {
	inp.addEventListener("focus", () => {
		inp.classList.add("active")
	})
	inp.addEventListener("blur", () => {
		if (inp.value != "") return
		inp.classList.remove("active")
	})
})

const passwordInput = document.getElementById("password")
const oldPasswordInput = document.getElementById("oldPassword")
const confirmPasswordInput = document.getElementById("confirmPassword")
const togglePasswordButton = document.getElementById("togglePassword")
const toggleoldPasswordButton = document.getElementById("toggleoldPassword")
const toggleconfirmPasswordButton = document.getElementById(
	"toggleconfirmPassword"
)

togglePasswordButton.addEventListener("click", function () {
	const isVisible =
		togglePasswordButton.getAttribute("data-visible") === "true"

	if (isVisible) {
		passwordInput.type = "password"
		togglePasswordButton.setAttribute("data-visible", "false")
		togglePasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility"
	} else {
		passwordInput.type = "text" // Hiển thị mật khẩu
		togglePasswordButton.setAttribute("data-visible", "true")
		togglePasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility_off"
	}
})

toggleoldPasswordButton.addEventListener("click", function () {
	const isVisible =
		toggleoldPasswordButton.getAttribute("data-visible") === "true"

	if (isVisible) {
		oldPasswordInput.type = "password"
		toggleoldPasswordButton.setAttribute("data-visible", "false")
		toggleoldPasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility"
	} else {
		oldPasswordInput.type = "text" // Hiển thị mật khẩu
		toggleoldPasswordButton.setAttribute("data-visible", "true")
		toggleoldPasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility_off"
	}
})

toggleconfirmPasswordButton.addEventListener("click", function () {
	const isVisible =
		toggleconfirmPasswordButton.getAttribute("data-visible") === "true"

	if (isVisible) {
		confirmPasswordInput.type = "password" // Ẩn mật khẩu
		toggleconfirmPasswordButton.setAttribute("data-visible", "false")
		toggleconfirmPasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility"
	} else {
		confirmPasswordInput.type = "text"
		toggleconfirmPasswordButton.setAttribute("data-visible", "true")
		toggleconfirmPasswordButton.querySelector(
			".material-symbols-outlined"
		).textContent = "visibility_off"
	}
})

const resetPasswordPost = document.getElementById("form-change-pass")
const password = document.getElementById("password")
const confirmPassword = document.getElementById("confirmPassword")
const oldPassword = document.getElementById("oldPassword")

resetPasswordPost.addEventListener("submit", (e) => {
	e.preventDefault()
	validateInput()
})

const setError = (element, message) => {
	const inputControl = element.parentElement
	const errorDisplay = inputControl.querySelector(`.error`)

	errorDisplay.innerText = message
	inputControl.classList.add("error")
	inputControl.classList.remove("error")
}

const setSuccess = (element) => {
	const inputControl = element.parentElement
	const errorDisplay = inputControl.querySelector(`.error`)

	errorDisplay.innerText = ""
	inputControl.classList.add("success")
	inputControl.classList.remove("error")
}

const validateInput = async () => {
	const oldPasswordValue = oldPassword.value.trim()
	const confirmPasswordValue = confirmPassword.value.trim()
	const passwordValue = password.value.trim()

	let isAllValid = true

	if (oldPasswordValue === "") {
		setError(oldPassword, "Vui lòng nhập mật khẩu!")
		isAllValid = false
	} else if (oldPasswordValue.length < 8) {
		setError(oldPassword, "Mật khẩu phải ít nhất 8 ký tự!")
		isAllValid = false
	} else {
		setSuccess(oldPassword)
	}

	if (passwordValue === "") {
		setError(password, "Vui lòng nhập mật khẩu!")
		isAllValid = false
	} else if (passwordValue.length < 8) {
		setError(password, "Mật khẩu phải ít nhất 8 ký tự!")
		isAllValid = false
	} else {
		setSuccess(password)
	}

	// Validate confirm password
	if (confirmPasswordValue === "") {
		setError(confirmPassword, "Vui lòng xác nhận mật khẩu!")
		isAllValid = false
	} else if (confirmPasswordValue !== passwordValue) {
		setError(confirmPassword, "Mật khẩu xác nhận không khớp!")
		isAllValid = false
	} else {
		setSuccess(confirmPassword)
	}

	if (isAllValid) {
		const reset = {
			user_old_password: oldPasswordValue,
			user_new_password: passwordValue,
		}
		await fetch("/auth/changePass", {
			method: "POST",
			body: JSON.stringify(reset),
			headers: {
				"Content-Type": "application/json",
			},
		})
			.then((res) => res.json())
			.then((back) => {
				if (back.status == "notMatchOldPassword") {
					setError(oldPassword, back.message)
				} else {
					const successModal = document.querySelector('.success-modal')
					successModal.style.display = 'flex'
					setTimeout(() => {
						successModal.style.display = 'none'
					}, 1000)

					location.reload()
				}
			})
	}
}

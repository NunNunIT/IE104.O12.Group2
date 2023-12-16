
function cleanDateFormatInput(inputDate) {
    // Sử dụng regular expression để loại bỏ các ký tự không mong muốn
    return inputDate.replace(/[^\d/]/g, '');
}

function convertDateFormatYMD(inputDate) {
    // Sử dụng hàm cleanDateFormatInput để loại bỏ ký tự không mong muốn
    var cleanedDate = cleanDateFormatInput(inputDate);

    // Chuyển định dạng ngày thành "yyyy-MM-dd" trước khi gán cho input
    var parts = cleanedDate.split("/");

    var result = parts[2] + "-" + parts[1] + "-" + parts[0];

    return result;
}

function convertDateFormat(inputDate) {
    if (!inputDate) {
        return "";
    }
    var parts = inputDate.split("-");
    return parts[2] + "/" + parts[1] + "/" + parts[0];
}

var datepickerShown = false;
var initialUserBirth = "";

document.addEventListener("DOMContentLoaded", function () {
    var userBirthDiv = document.querySelector(".userBirth");
    userBirthDiv.addEventListener("click", showDatePicker);

    // Lưu trữ giá trị ban đầu của ngày sinh
    var displayUserBirth = document.getElementById("displayUserBirth");
    initialUserBirth = displayUserBirth.textContent;

    let userBirthInput = document.getElementById("userBirth");

    // Kiểm tra nếu initialUserBirth có giá trị thì mới đặt giá trị cho userBirthInput
    if (initialUserBirth) {
        userBirthInput.value = convertDateFormatYMD(initialUserBirth);
    }
});

function showDatePicker() {
    let displayUserBirth = document.getElementById("displayUserBirth");
    let userBirthInput = document.getElementById("userBirth");

    if (!datepickerShown) {
        // Ẩn hiển thị span, hiển thị input và đặt giá trị của input từ span
        displayUserBirth.style.display = "none";
        userBirthInput.style.display = "inline-block";

        // Sự kiện thay đổi giá trị input
        userBirthInput.addEventListener("change", function () {
            userBirthInput.value = (userBirthInput.value);
            // Cập nhật giá trị trong span khi người dùng thay đổi giá trị trong input
            displayUserBirth.textContent = convertDateFormat(userBirthInput.value);

            // Ẩn input, hiển thị span và đặt trạng thái datepickerShown
            userBirthInput.style.display = "none";
            displayUserBirth.style.display = "inline-block";
            datepickerShown = false;
        });

        datepickerShown = true;
    }
}

const form = document.getElementById('editForm')
const userName = document.getElementById('userName')
const userEmail = document.getElementById('userEmail')
const userPhone = document.getElementById('userPhone')
const userAddress = document.getElementById('userAddress')

form.addEventListener('submit', e => {
    e.preventDefault()
    // Validate input and send update request
    validateInput().then(response => {
        if (response && response.ok) {
            // Redirect to /account/information if the update is successful
            window.location.href = '/account/information';
        } else {
            console.error('Update failed');
        }
    }).catch(error => {
        console.error('Error:', error);
    });
})

const setError = (element, message) => {
    const inputControl = element.parentElement
    const errorDisplay = inputControl.querySelector('.error-message')

    errorDisplay.innerText = message
    inputControl.classList.add('error')
    inputControl.classList.remove('error')
}

const setSuccess = element => {
    const inputControl = element.parentElement
    const errorDisplay = inputControl.querySelector('.error-message')

    errorDisplay.innerText = ''
    inputControl.classList.add('success')
    inputControl.classList.remove('error')
}

const isValidUserName = userName => {
    const re = /^[a-zA-Z\sàáạảãăắằẵặẳâầấậẩẫđèéẹẻẽêềếệểễòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữìíịỉĩỳýỵỷỹ]+$/
    return re.test(String(userName).trim())
}

const isValidPhoneNumber = phoneNumber => {
    const re = /^[0-9]{10}$/
    return re.test(String(phoneNumber).trim())
}

const isValidEmail = email => {
    if (!email) {
        return true;
    }
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return re.test(String(email).toLowerCase())
}

const validateInput = () => {
    return new Promise(async (resolve, reject) => {
        const userNameValue = userName.value.trim()
        const userEmailValue = userEmail.value.trim()
        const userPhoneValue = userPhone.value.trim()

        let isAllValid = true

        if (userNameValue === '') {
            setError(userName, 'Vui lòng nhập họ tên!')
            isAllValid = false
        } else if (!isValidUserName(userNameValue)) {
            setError(userName, 'Họ tên không đúng định dạng!')
            isAllValid = false
        } else {
            setSuccess(userName)
        }

        if (!isValidEmail(userEmailValue)) {
            setError(userEmail, 'Email không đúng định dạng!')
            isAllValid = false
        } else {
            setSuccess(userEmail)
        }

        if (userPhoneValue === '') {
            setError(userPhone, 'Vui lòng nhập số điện thoại!')
            isAllValid = false
        } else if (!isValidPhoneNumber(userPhoneValue)) {
            setError(userPhone, 'Số điện thoại không đúng định dạng!')
            isAllValid = false
        } else {
            setSuccess(userPhone)
        }

        if (isAllValid) {
            try {
                const response = await sendUpdateRequest();
                resolve(response);
            } catch (error) {
                reject(error);
            }
        } else {
            // If validation fails, resolve with a null response
            resolve(null);
        }
    });
}

const sendUpdateRequest = async () => {
    const userNameValue = userName.value.trim()
    const userBirthValue = userBirth.value.trim()
    const userSexValue = userSex.value.trim()
    const userEmailValue = userEmail.value.trim()
    const userPhoneValue = userPhone.value.trim()
    const userAddressValue = userAddress.value.trim()

    const requestBody = {
        user_name: userNameValue,
        user_birth: userBirthValue,
        user_sex: userSexValue,
        user_email: userEmailValue,
        user_phone: userPhoneValue,
        user_address: userAddressValue
    }

    try {
        const response = await fetch('/account/edit-information', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(requestBody),
        });

        return response;
    } catch (error) {
        console.error('Error sending update request:', error);
        throw error;
    }
}
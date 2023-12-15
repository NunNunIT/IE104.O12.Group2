document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('editForm')
    const saveButton = document.getElementById('saveButton')

    form.addEventListener('submit', function (e) {
        e.preventDefault()
        validateInput()
    })

    saveButton.addEventListener('click', function () {
        validateInput()
    })
})

const form = document.getElementById('editForm')
const userName = document.getElementById('userName')
const userEmail = document.getElementById('userEmail')
const userPhone = document.getElementById('userPhone')
const userAddress = document.getElementById('userAddress')

form.addEventListener('submit', e => {
    e.preventDefault()
    validateInput()
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
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return re.test(String(email).toLowerCase())
}

const validateInput = () => {
    const userNameValue = userName.value.trim()
    const userEmailValue = userEmail.value.trim()
    const userPhoneValue = userPhone.value.trim()
    const userAddressValue = userAddress.value.trim()

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

    if (userEmailValue === '') {
        setError(userEmail, 'Vui lòng nhập email!')
        isAllValid = false
    } else if (!isValidEmail(userEmailValue)) {
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

    if (userAddressValue === '') {
        setError(userAddress, 'Vui lòng nhập địa chỉ!')
        isAllValid = false
    } else {
        setSuccess(userAddress)
    }

    // Nếu tất cả các trường thông tin hợp lệ, thì gửi form
    if (isAllValid) {
        // form.submit()
        sendUpdateRequest()
    }
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

    const response = await fetch('/account/edit-information', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestBody)
    })

    if (response.ok) {
        window.location.href = '/account/information'
    } else {
        console.error('Update failed')
    }
}
let isNameValid
let isPhoneNumberValid

function validateName(event) {
    const nameRegex = /^[A-Za-z\s]+$/
    const name = event.currentTarget
    if (nameRegex.test(name.value) == false) {
        name.nextElementSibling.style.display = 'block'
        isNameValid = false
    }
    else {
        name.nextElementSibling.style.display = 'none'
        isNameValid = true
    }
}

function validatePhoneNumber(event) {
    const vnPhoneNumberRegex = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/
    const phoneNumber = event.currentTarget
    if (vnPhoneNumberRegex.test(phoneNumber.value) == false) {
        phoneNumber.nextElementSibling.style.display = 'block'
        isPhoneNumberValid = false
    }
    else {
        phoneNumber.nextElementSibling.style.display = 'none'
        isPhoneNumberValid = true
    }
}

const orderForm = document.querySelector('#order-form')
orderForm.addEventListener('submit', (event) => {
    event.preventDefault()
    if (isNameValid && isPhoneNumberValid == true)
        orderForm.submit()
})
let isNameValid
let isPhoneNumberValid

// Kiểm tra định dạng họ và tên
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

    if (name.value == '') {
        name.nextElementSibling.style.display = 'block'
        name.nextElementSibling.textContent = 'Vui lòng điền họ và tên người nhận hàng!'
    }
}

// Kiểm tra định dạng số điện thoại Việt Nam
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

    if (phoneNumber.value == '') {
        phoneNumber.nextElementSibling.style.display = 'block'
        phoneNumber.nextElementSibling.textContent = 'Vui lòng điền số điện thoại người nhận hàng!'
    }
}

// Gửi form
const orderForm = document.querySelector('#order-form')
orderForm.addEventListener('submit', (event) => {
    event.preventDefault()
    if (isNameValid && isPhoneNumberValid == true)
        orderForm.submit()
})

// Select địa chỉ
const districtsAndWardsHCMC = [
    {
        district: "Quận 1",
        wards: ["Phường Bến Thành", "Phường Cầu Kho", "Phường Cầu Ông Lãnh", "Phường Cô Giang", "Phường Đa Kao"]
    },
    {
        district: "Quận 2",
        wards: ["Phường An Phú", "Phường Bình An", "Phường Bình Khánh", "Phường Bình Trưng Đông", "Phường Bình Trưng Tây"]
    },
    {
        district: "Quận 3",
        wards: ["Phường 7", "Phường 8", "Phường 9", "Phường 10", "Phường 11"]
    },
    {
        district: "Quận 4",
        wards: ["Phường 1", "Phường 2", "Phường 3", "Phường 4", "Phường 5"]
    },
    {
        district: "Quận 5",
        wards: ["Phường 14", "Phường 15", "Phường 16", "Phường 17", "Phường 18"]
    },
    {
        district: "Quận 6",
        wards: ["Phường 1", "Phường 2", "Phường 3", "Phường 4", "Phường 5"]
    },
    {
        district: "Quận 7",
        wards: ["Phường Tân Thuận Đông", "Phường Tân Thuận Tây", "Phường Tân Kiểng", "Phường Tân Hưng", "Phường Bình Thuận"]
    },
    {
        district: "Quận 8",
        wards: ["Phường 1", "Phường 2", "Phường 3", "Phường 4", "Phường 5"]
    },
    {
        district: "Quận 9",
        wards: ["Phường Long Bình", "Phường Long Thạnh Mỹ", "Phường Tân Phú", "Phường Hiệp Phú", "Phường Tăng Nhơn Phú A"]
    },
    {
        district: "Quận 10",
        wards: ["Phường 1", "Phường 2", "Phường 3", "Phường 4", "Phường 5"]
    }
]

const districtsAndWardsVungTau = [
    {
        district: "Quận 1",
        wards: ["Phường 1", "Phường 2", "Phường 3", "Phường 4", "Phường 5"]
    },
    {
        district: "Quận 2",
        wards: ["Phường 6", "Phường 7", "Phường 8", "Phường 9", "Phường 10"]
    },
    {
        district: "Quận 3",
        wards: ["Phường 11", "Phường 12", "Phường 13", "Phường 14", "Phường 15"]
    },
    {
        district: "Quận 4",
        wards: ["Phường 16", "Phường 17", "Phường 18", "Phường 19", "Phường 20"]
    },
    {
        district: "Quận 5",
        wards: ["Phường 21", "Phường 22", "Phường 23", "Phường 24", "Phường 25"]
    }
]

// Xóa danh sách quận/huyện
function clearDistrict() {
    const districtInput = document.querySelector('input[list="district"')
    const options = document.querySelectorAll('#district option')

    districtInput.value = ''
    options.forEach(option => {
        option.remove()
    })
}

// Xóa danh sách phường/xã
function clearWard() {
    const wardInput = document.querySelector('input[list="ward"')
    const options = document.querySelectorAll('#ward option')

    wardInput.value = ''
    options.forEach(option => {
        option.remove()
    })
}

// Sự kiện onchange tỉnh/thành phố
function changeProvince(event) {
    clearDistrict()

    let districtDatalist = document.querySelector('#district')
    if (event.currentTarget.value == 'Hồ Chí Minh') {
        districtsAndWardsHCMC.forEach(item => {
            let option = document.createElement('option')
            option.value = item.district
            districtDatalist.appendChild(option)
        })
    }
    else if (event.currentTarget.value == 'Vũng Tàu') {
        districtsAndWardsVungTau.forEach(item => {
            let option = document.createElement('option')
            option.value = item.district
            districtDatalist.appendChild(option)
        })
    }
    else {
        clearWard()
    }
}

// Sự kiện onchange tỉnh/thành phố
function changeDistrict(event) {
    clearWard()

    let wardDatalist = document.querySelector('#ward')
    const districtValue = document.querySelector('input[list="district"]').value
    const provinceValue = document.querySelector('input[list="province"]').value
    if (provinceValue == 'Hồ Chí Minh') {
        districtsAndWardsHCMC.find(ele => ele.district == districtValue).wards.forEach(ward => {
            let option = document.createElement('option')
            option.value = ward
            wardDatalist.appendChild(option)
        })
    }
    else if (provinceValue == 'Vũng Tàu') {
        districtsAndWardsVungTau.find(ele => ele.district == districtValue).wards.forEach(ward => {
            let option = document.createElement('option')
            option.value = ward
            wardDatalist.appendChild(option)
        })
    }
}
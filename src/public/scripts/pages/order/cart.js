// Sự kiện onclick checkbox chọn tất cả
function checkAll(event) {
    let checkboxes
    if (window.innerWidth <= 416)
        checkboxes = document.querySelectorAll('.checkbox.mobile-display')
    else
        checkboxes = document.querySelectorAll('.checkbox.mobile-hidden')
    checkboxes.forEach(checkbox => checkbox.checked = event.currentTarget.checked)

    showSelectedNums()
    changeDel()
}

// Sự kiện onclick nút "Chọn tất cả"
function checkAllBtn(event) {
    const checkAll = document.querySelector('#check-all')
    checkAll.checked = !checkAll.checked

    let checkboxes
    if (window.innerWidth <= 416)
        checkboxes = document.querySelectorAll('.checkbox.mobile-display')
    else
        checkboxes = document.querySelectorAll('.checkbox.mobile-hidden')
    checkboxes.forEach(checkbox => checkbox.checked = checkAll.checked)

    showSelectedNums()
    changeDel()
}

// Sự kiện onclick nút "Xóa" tất cả
function deleteAllItem(event) {
    const checkboxes = Array.from(document.querySelectorAll('.checkbox')).slice(1)
    checkboxes.forEach((checkbox, index) => {
        if (index % 2 == 0 && checkbox.checked == true) {
            checkbox.parentNode.nextElementSibling.remove()
            checkbox.parentNode.remove()
        }
    })

    showSelectedNums()
    showEmptyNoti()
}

// Sự kiện onclick nút "Xóa" responsive điện thoại
function deleteMbItem(event) {
    const checkboxes = Array.from(document.querySelectorAll('.checkbox')).slice(1)
    checkboxes.forEach((checkbox, index) => {
        if (index % 2 == 1 && checkbox.checked == true) {
            checkbox.parentNode.previousElementSibling.remove()
            checkbox.parentNode.remove()
        }
    })

    showSelectedNums()
    showEmptyNoti()
}

// Hàm thay đổi màu nút "Xóa" tất cả
function changeDel() {
    const delBtn = document.querySelector('#del-btn')
    if (Array.from(document.querySelectorAll('.checkbox')).some(checkbox => checkbox.checked == true)) {
        delBtn.style.background = 'var(--dollar-red)'
        delBtn.style.color = 'var(--white)'
    }
    else {
        delBtn.style.removeProperty('background')
        delBtn.style.removeProperty('color')
    }
}

// Hàm hiển thị số lượng sản phẩm được lựa chọn
function showSelectedNums() {
    const checkboxes = Array.from(document.querySelectorAll('.checkbox')).slice(1)
    let count = 0
    checkboxes.forEach(checkbox => {
        if (checkbox.checked == true)
            count++
    })

    const selectedNumsSpan = document.querySelectorAll('.selected-nums')
    selectedNumsSpan.forEach(span => span.innerHTML = count)
}

// Hàm hiện thông báo không có sản phẩm trong giỏ
function showEmptyNoti() {
    let countCartItem
    if (window.innerWidth <= 416)
        countCartItem = Array.from(document.querySelectorAll('.cart-item.mobile-display')).length
    else
        countCartItem = Array.from(document.querySelectorAll('.cart-item.mobile-hidden')).length

    if (countCartItem == 0) {
        const emptyNoti = document.querySelector('.cart__empty')
        emptyNoti.style.display = 'flex'
    }
}

// Căn chỉnh cart-item cuối cùng
let cartItems
if (window.innerWidth <= 416)
    cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-display'))
else
    cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-display'))

const lastCartItem = cartItems[cartItems.length - 1]
lastCartItem.style.border = 'none'
lastCartItem.style.padding = '0'

// Sự kiện onclick nút "Đặt hàng"
function cartSubmit(event) {
    event.preventDefault()
    const cartForm = document.getElementById('cart-form')

    const selectedCartItem = Array.from(document.querySelectorAll('.checkbox'))
        .filter(item => item.checked == true && item.id != 'check-all')
        .map(item => item.parentNode)

    if (selectedCartItem.length > 0) {
        const unselectedCartItem = Array.from(document.querySelectorAll('.checkbox'))
            .filter(item => item.checked == false && item.id != 'check-all')
            .map(item => item.parentNode)
            .forEach(item => item.querySelectorAll('input, select').forEach(input => input.disabled = true))

        const formData = new FormData(cartForm)
        const transformedData = []
        console.log(formData.getAll('variant'))

        formData.getAll('variant').forEach((variant, index) => {
            transformedData.push({
                variant: variant,
                quantity: parseInt(formData.getAll('quantity')[index], 10)
            })
        })

        // Use fetch to submit the data
        fetch('/order/cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(transformedData),
        })
    }
}

// Hàm thực thi
showEmptyNoti()
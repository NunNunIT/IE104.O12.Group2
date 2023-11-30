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

// Sự kiện onclick nút 'Chọn tất cả'
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

// Sự kiện onclick nút 'Xóa' tất cả
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

// Sự kiện onclick nút 'Xóa' responsive điện thoại
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

// Hàm thay đổi màu nút 'Xóa' tất cả
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
    cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-hidden'))

const lastCartItem = cartItems[cartItems.length - 1]
lastCartItem.style.border = 'none'
lastCartItem.style.padding = '0'

// Sự kiện onclick nút 'Đặt hàng'
function cartSubmit(event) {
    event.preventDefault()

    let cartItems
    if (window.innerWidth <= 416)
        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-display'))
    else
        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-hidden'))

    const checkedItem = cartItems.filter(item => item.querySelector('.checkbox').checked == true)

    if (checkedItem.length > 0) {
        const formDataArray = []

        checkedItem.forEach(item => {
            let productVariantId = item.querySelector('input[name="product_variant_id"]')
            let productQuantity = item.querySelector('input[name="product_quantity"]')
            let productUnitPriceBefore = item.querySelector('input[name="product_variant_price_before"]')
            let productUnitPriceAfter = item.querySelector('input[name="product_variant_price_after"]')
            let productPrice = item.querySelector('input[name="product_price"]')

            // Create an object for each item and push it to the array
            formDataArray.push({
                product_variant_id: Number(productVariantId.value),
                product_quantity: Number(productQuantity.value),
                product_variant_price_before: Number(productUnitPriceBefore.value),
                product_variant_price_after: Number(productUnitPriceAfter.value),
                product_price: Number(productPrice.value),
            })
        })

        // Convert the array to a JSON string if needed
        const jsonData = JSON.stringify(formDataArray)

        // Use jsonData in your fetch request
        fetch('/order/cart/buy', {
            body: jsonData,
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
        })
        // .then(res => res.json())
        // .then(back => {
        //     if (back.status == 'error') {
        //     } else {
        //         history.back()
        //         location.reload()
        //     }
        // })

        // const cartForm = document.getElementById('cart-form')
        // cartForm.submit()
    }
}

// Chuyển đổi số thành tiền
function toCurrency(money) {
    let currency = money.toFixed(0).replace(/./g, function (c, i, a) {
        return i > 0 && c !== ',' && (a.length - i) % 3 === 0 ? '.' + c : c
    })
    return currency
}

// Sự kiện onchange tính tổng tiền
function calcTotalPrice(event) {
    const totalPrice = document.querySelector('.cart__total-price h2')
    let cartItems

    if (window.innerWidth <= 416)
        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-display'))
    else
        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-hidden'))

    let total = 0
    cartItems.forEach(item => {
        if (item.querySelector('.checkbox').checked == true) {
            let itemPrice = Number(item.querySelector('.cart-item__price').textContent.slice(0, -1).replaceAll('.', ''))
            total += Number(itemPrice)
        }
    })

    totalPrice.innerHTML = toCurrency(total) + 'đ'

    let totalPriceDel = 0
    cartItems.forEach(item => {
        let unitPriceDel = item.querySelector('.cart-item__unit-price del')
        let checkbox = item.querySelector('.checkbox')
        if (unitPriceDel && checkbox.checked)
            unitPriceDel = unitPriceDel.textContent.slice(0, -1).replaceAll('.', '')

        totalPriceDel += Number(item.querySelector('.cart-item__quantity input').value) * Number(unitPriceDel)
    })

    if (isNaN(totalPriceDel))
        totalPriceDel = 0

    const totalPriceDelEle = document.querySelector('.cart__total-price del')
    if (totalPriceDelEle)
        totalPriceDelEle.innerHTML = toCurrency(totalPriceDel) + 'đ'
}

// Hàm thực thi
showEmptyNoti()
// Sự kiện onclick checkbox chọn 1 item
function checkOne(event) {
    const checkAll = document.getElementById('check-all')
    if (event.currentTarget.checked == false)
        checkAll.checked = false

    let checkboxes
    if (window.innerWidth <= 416)
        checkboxes = document.querySelectorAll('.checkbox.mobile-display')
    else
        checkboxes = document.querySelectorAll('.checkbox.mobile-hidden')

    if (Array.from(checkboxes).filter(checkbox => checkbox.checked == false).length == 0)
        checkAll.checked = true

    showSelectedNums()
    changeDel()
}

// Sự kiện onclick nút "Xóa" 1 item
function removeItem(event) {
    const cartItem = event.currentTarget.parentElement.parentElement
    console.log(cartItem)
    cartItem.remove()

    showSelectedNums()
    showEmptyNoti()
}

// Tạo sự kiện change cho phần tử
function triggerChangeEvent(element) {
    var event = new Event('change', { bubbles: true })
    element.dispatchEvent(event)
}

// Sự kiện onclick nút giảm số lượng
function minus(event) {
    const input = event.currentTarget.nextElementSibling

    if (input.value > 0) {
        input.value = Number(input.value) - 1
        triggerChangeEvent(input)
    }
}

// Sự kiện onclick nút tăng số lượng
function add(event) {
    const input = event.currentTarget.previousElementSibling
    input.value = Number(input.value) + 1
    triggerChangeEvent(input)
}

// Chuyển đổi số thành tiền
function toCurrency(money) {
    let currency = money.toFixed(0).replace(/./g, function (c, i, a) {
        return i > 0 && c !== "," && (a.length - i) % 3 === 0 ? "." + c : c
    })
    return currency
}

// Sự kiện onchange tính tiền
function calcPrice(event) {
    const input = event.currentTarget
    const cartItem = event.currentTarget.parentElement.parentElement
    const unitPrice = cartItem.querySelector('.cart-item__unit-price p')
    const priceEle = cartItem.querySelector('.cart-item__price')

    const price = Number(input.value) * Number(unitPrice.textContent.slice(0, -1).replaceAll('.', ''))
    priceEle.innerHTML = toCurrency(price) + 'đ'

    const unitPriceDel = cartItem.querySelector('.cart-item__unit-price del')
    const totalPriceDel = document.querySelector('.cart__total-price del')
    const priceDel = Number(input.value) * Number(unitPrice.textContent.slice(0, -1).replaceAll('.', ''))
    totalPriceDel.innerHTML = toCurrency(priceDel) + 'đ'
}
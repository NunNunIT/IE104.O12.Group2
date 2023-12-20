function enableButton() {
    const deleteBtn = document.querySelector('.cart__del-btn')
    const deleteBtnMb = document.querySelector('#del-mb-btn')
    const submitBtn = document.querySelector('.cart__order input')
    deleteBtn.disabled = false
    deleteBtnMb.disabled = false
    submitBtn.disabled = false
}

function disableButton() {
    const deleteBtn = document.querySelector('.cart__del-btn')
    const deleteBtnMb = document.querySelector('#del-mb-btn')
    const submitBtn = document.querySelector('.cart__order input')
    deleteBtn.disabled = true
    deleteBtnMb.disabled = true
    submitBtn.disabled = true
}

// Sự kiện onclick checkbox chọn tất cả
function checkAll(event) {
    if (event.currentTarget.checked == false)
        disableButton()
    else
        enableButton()

    let checkboxes
    if (window.innerWidth <= 416)
        checkboxes = document.querySelectorAll('.checkbox.mobile-display')
    else
        checkboxes = document.querySelectorAll('.checkbox.mobile-hidden')
    checkboxes.forEach(checkbox => checkbox.checked = event.currentTarget.checked)

    showSelectedNums()
}

// Sự kiện onclick nút 'Chọn tất cả'
function checkAllBtn(event) {
    if (event.currentTarget.checked == false)
        disableButton()
    else
        enableButton()

    const checkAll = document.querySelector('#check-all')
    checkAll.checked = !checkAll.checked

    let checkboxes
    if (window.innerWidth <= 416)
        checkboxes = document.querySelectorAll('.checkbox.mobile-display')
    else
        checkboxes = document.querySelectorAll('.checkbox.mobile-hidden')
    checkboxes.forEach(checkbox => checkbox.checked = checkAll.checked)

    showSelectedNums()
}

// Sự kiện onclick nút 'Xóa' tất cả
function deleteAllItem(event) {
    let cartItems
    if (window.innerWidth <= 416)
        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-display'))
    else
        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-hidden'))

    const checkedItem = cartItems.filter(item => item.querySelector('.checkbox').checked == true)

    if (!JSON.parse(localStorage.getItem('productsCartDelete')))
        localStorage.setItem('productsCartDelete', JSON.stringify([]))
    const productsCartDelete = JSON.parse(localStorage.getItem('productsCartDelete'))

    checkedItem.forEach(item => {
        let productVariantId = item.querySelector('input[name="product_variant_id"]')
        productsCartDelete.push({
            product_variant_id: Number(productVariantId.value),
        })
        item.remove()
    })

    localStorage.removeItem('productsCartDelete')
    localStorage.setItem('productsCartDelete', JSON.stringify(productsCartDelete))

    const countCartEle = document.querySelector('.header__cart__number-badge')
    countCartEle.innerHTML = Number(countCartEle.innerHTML) - checkedItem.length

    const selectedNumsSpan = document.querySelectorAll('.selected-nums')
    selectedNumsSpan.forEach(span => span.innerHTML = 0)

    showEmptyNoti()
    modifyLastItem()
    deleteDropdown()
    calcTotalPrice()
}

// Xóa sản phẩm phải xóa ở dropdown cart
function deleteDropdown(event) {
    const dropdownCart = document.querySelector('.dropdown-cart__content')
    const dropdownItems = Array.from(dropdownCart.querySelectorAll('.cart-dropdown__block'))
    const deleteEle = JSON.parse(localStorage.getItem('productsCartDelete'))

    let countDeleted = 0
    dropdownItems.forEach(item => {
        deleteEle.forEach(ele => {
            let dropdownItemLink = item.querySelector('.cart-dropdown__main')
            let productVariantId = Number(dropdownItemLink.getAttribute('href').split('?')[0].split('/')[2])
            if (ele.product_variant_id == productVariantId) {
                item.remove()
                countDeleted++
            }
        })
    })

    if (countDeleted == dropdownItems.length) {
        dropdownCart.innerHTML =
            `<div class="dropdown-cart__content-title--empty">Sản phẩm vừa thêm</div>
            <div class="dropdown-cart--empty">
                <img src="/imgs/cart/empty-cart.png" alt="empty" class="dropdown-cart__img--empty">
                <span class="empty-content__cart">Giỏ hàng trống</span>
            </div>
            <a href="/order/cart" class="btn-cart btn-cart--empty">
                <div class="btn btn--filled pri">Xem giỏ hàng</div>
            </a>`
    }
}

// Xóa sản phẩm trong giỏ khi reload hoặc chuyển trang
window.addEventListener('load', deleteItems)
window.addEventListener('beforeunload', deleteItems)
function deleteItems(event) {
    const loading = document.querySelector('.lds-ring')
    const loadingHidden = document.querySelector('.loading-hidden')
    const productsCartDelete = JSON.parse(localStorage.getItem('productsCartDelete'))
    if (Array.isArray(productsCartDelete)) {
        if (productsCartDelete.length) {
            fetch('/order/cart/delete', {
                body: JSON.stringify(productsCartDelete),
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
                .then(() => {
                    let cartItems
                    if (window.innerWidth <= 416)
                        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-display'))
                    else
                        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-hidden'))

                    productsCartDelete.forEach(del => {
                        cartItems.forEach(item => {
                            if (item.querySelector('input[name="product_variant_id"]').value == Number(del.product_variant_id))
                                item.remove()
                        })
                    })

                    localStorage.removeItem('productsCartDelete')

                    loading.style.visibility = 'hidden'
                    loadingHidden.style.visibility = 'visible'

                    showEmptyNoti()
                })
        }
        else {
            loading.style.visibility = 'hidden'
            loadingHidden.style.visibility = 'visible'
        }
    }
    else {
        loading.style.visibility = 'hidden'
        loadingHidden.style.visibility = 'visible'
    }
}

// Sự kiện onclick nút 'Xóa' responsive điện thoại
function deleteMbItem(event) {
    let cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-display'))

    const checkedItem = cartItems.filter(item => item.querySelector('.checkbox').checked == true)

    if (!JSON.parse(localStorage.getItem('productsCartDelete')))
        localStorage.setItem('productsCartDelete', JSON.stringify([]))
    const productsCartDelete = JSON.parse(localStorage.getItem('productsCartDelete'))

    checkedItem.forEach(item => {
        let productVariantId = item.querySelector('input[name="product_variant_id"]')
        productsCartDelete.push({
            product_variant_id: Number(productVariantId.value),
        })
        item.remove()
    })

    localStorage.removeItem('productsCartDelete')
    localStorage.setItem('productsCartDelete', JSON.stringify(productsCartDelete))

    const countCartEle = document.querySelector('.header__cart__number-badge')
    countCartEle.innerHTML = Number(countCartEle.innerHTML) - checkedItem.length

    showEmptyNoti()
    modifyLastItem()
    showSelectedNums()
    deleteDropdown()
    calcTotalPrice()
}

// Cập nhật sản phẩm trong giỏ hàng khi reload hoặc chuyển trang
window.addEventListener('load', updateCart)
window.addEventListener('beforeunload', updateCart)
function updateCart(event) {
    const productsCartUpdate = JSON.parse(localStorage.getItem('productsCartUpdate'))
    const productsCartUpdateOld = JSON.parse(localStorage.getItem('productsCartUpdateOld'))
    if (Array.isArray(productsCartUpdate) && Array.isArray(productsCartUpdateOld)) {
        if (productsCartUpdate.length && productsCartUpdateOld.length) {
            productsCartUpdate.forEach(product => delete product.product_id)

            fetch('/order/updateCart', {
                body: JSON.stringify({ productsCartUpdate, productsCartUpdateOld }),
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
            })
            localStorage.removeItem('productsCartUpdate')
            localStorage.removeItem('productsCartUpdateOld')
        }
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

        const cartTitle = document.querySelector('.cart__title')
        cartTitle.remove()

        const cartFooter = document.querySelector('.cart__footer')
        cartFooter.remove()
    }
}

// Căn chỉnh cart-item cuối cùng
function modifyLastItem() {
    let cartItems
    if (window.innerWidth <= 416)
        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-display'))
    else
        cartItems = Array.from(document.querySelectorAll('.cart-item.mobile-hidden'))

    if (cartItems.length) {
        const lastCartItem = cartItems[cartItems.length - 1]
        lastCartItem.style.border = 'none'
        lastCartItem.style.padding = '0'
    }
}

const cartSubmitForm = document.getElementById('cart-form')
cartSubmitForm.addEventListener('submit', (e) => {
    e.preventDefault()
})

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

            // Create an object for each item and push it to the array
            formDataArray.push({
                product_variant_id: Number(productVariantId.value),
                order_detail_quantity: Number(productQuantity.value),
            })
        })

        let formDataArrayString = JSON.stringify(formDataArray)

        localStorage.setItem('formDataArray', formDataArrayString)
        window.location.href = '/order/information'
    }
}

// Chuyển đổi số thành tiền
function toCurrency(money) {
    let currency = money.toFixed(0).replace(/./g, function (c, i, a) {
        return i > 0 && c !== ',' && (a.length - i) % 3 === 0 ? '.' + c : c
    })
    return currency + 'đ'
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
        let checkbox = item.querySelector('.checkbox')
        if (checkbox.checked) {
            let itemPrice = Number(item.querySelector('.cart-item__unit-price p').textContent.slice(0, -1).replaceAll('.', ''))
            total += Number(item.querySelector('.cart-item__quantity input').value) * Number(itemPrice)
        }
    })

    totalPrice.innerHTML = toCurrency(total)

    let totalPriceDel = 0
    cartItems.forEach(item => {
        let checkbox = item.querySelector('.checkbox')
        if (checkbox.checked) {
            if (item.querySelector('.cart-item__unit-price del')) {
                let unitPriceDel = item.querySelector('.cart-item__unit-price del').textContent.slice(0, -1).replaceAll('.', '')
                totalPriceDel += Number(item.querySelector('.cart-item__quantity input').value) * Number(unitPriceDel)
            } else {
                let itemPrice = Number(item.querySelector('.cart-item__unit-price p').textContent.slice(0, -1).replaceAll('.', ''))
                totalPriceDel += Number(item.querySelector('.cart-item__quantity input').value) * Number(itemPrice)
            }
        }
    })

    const totalPriceDelEle = document.querySelector('.cart__total-price del')

    if (totalPriceDelEle) {
        if (isNaN(totalPriceDel)) {
            totalPriceDel = 0
            totalPriceDelEle.style.display = 'none'
        }
        else if (total == totalPriceDel) {
            totalPriceDel = 0
            totalPriceDelEle.style.display = 'none'
        } else {
            totalPriceDelEle.innerHTML = toCurrency(totalPriceDel)
            totalPriceDelEle.style.display = 'flex'
        }
    }
}

// Hàm thực thi
showEmptyNoti()
modifyLastItem()
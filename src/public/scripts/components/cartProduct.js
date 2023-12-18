// Sự kiện onclick checkbox chọn 1 item
function checkOne(event) {
    const checkAll = document.getElementById('check-all')

    let checkboxes
    if (window.innerWidth <= 416)
        checkboxes = Array.from(document.querySelectorAll('.checkbox.mobile-display'))
    else
        checkboxes = Array.from(document.querySelectorAll('.checkbox.mobile-hidden'))

    if (checkboxes.every(checkbox => checkbox.checked == true))
        checkAll.checked = true
    else
        checkAll.checked = false

    if (checkboxes.some(checkbox => checkbox.checked == true))
        enableButton()
    else
        disableButton()

    showSelectedNums()

    const cartItem = event.currentTarget.parentElement
    const input = cartItem.querySelector('input')
    triggerChangeEvent(input)

    const checkbox = cartItem.querySelector('.checkbox')
    if (checkbox.checked == true) {
        let cartItems
        if (window.innerWidth <= 416)
            cartItems = document.querySelectorAll('.cart-item.mobile-display')
        else
            cartItems = document.querySelectorAll('.cart-item.mobile-hidden')

        let totalPriceDel = 0
        cartItems.forEach(item => {
            let unitPriceDel = item.querySelector('.cart-item__unit-price del')
            if (unitPriceDel) {
                unitPriceDel = unitPriceDel.textContent.slice(0, -1).replaceAll('.', '')
            }
            totalPriceDel += Number(item.querySelector('.cart-item__quantity input').value) * Number(unitPriceDel)
        })

        const totalPriceDelEle = document.querySelector('.cart__total-price del')
        if (totalPriceDelEle)
            totalPriceDelEle.innerHTML = toCurrency(totalPriceDel)
    }
}

// Sự kiện onchange chọn biến thể
function changeVariant(event) {
    const current = event.currentTarget
    const variantValue = current.value.split(',')
    const variantId = variantValue[0]
    const variantPrice = Number(variantValue[1])
    const variantDiscount = Number(variantValue[2])
    const variantProductId = Number(variantValue[3])

    const cartItem = current.parentElement.parentElement
    const variantUnitPrice = cartItem.querySelector('.cart-item__unit-price')

    if (isNaN(variantDiscount)) {
        variantUnitPrice.innerHTML =
            `<input type="hidden" name="product_variant_price_before" value="" placeholder="">
            <input type="hidden" name="product_variant_price_after" value="${variantPrice}" placeholder="">
            <p class="cart-item__unit-price-number">${toCurrency(variantPrice)}</p>`
    }
    else {
        variantUnitPrice.innerHTML =
            `<input type="hidden" name="product_variant_price_before" value="${variantPrice}" placeholder="">
            <del>${toCurrency(variantPrice)}</del>
            <input type="hidden" name="product_variant_price_after" value="${parseInt(variantPrice - variantPrice * (variantDiscount / 100))}" placeholder="">
            <p class="cart-item__unit-price-number">${toCurrency(parseInt(variantPrice - variantPrice * (variantDiscount / 100)))}</p>`
    }

    const quantityInput = cartItem.querySelector('.cart-item__quantity input')
    triggerChangeEvent(quantityInput)

    const quantity = quantityInput.value
    if (!JSON.parse(localStorage.getItem('productsCartUpdate')))
        localStorage.setItem('productsCartUpdate', JSON.stringify([]))
    const productsCartUpdate = JSON.parse(localStorage.getItem('productsCartUpdate'))

    if (!productsCartUpdate.length)
        productsCartUpdate.push({ 'product_id': variantProductId, 'product_variant_id': variantId, 'cart_quantity': quantity })
    else {
        productsCartUpdate.forEach((product, index) => {
            if (variantProductId == product.product_id) {
                productsCartUpdate.splice(index, 1)
                productsCartUpdate.push({ 'product_id': variantProductId, 'product_variant_id': variantId, 'cart_quantity': quantity })
            }
        })
    }

    localStorage.removeItem('productsCartUpdate')
    localStorage.setItem('productsCartUpdate', JSON.stringify(productsCartUpdate))

    if (!JSON.parse(localStorage.getItem('productsCartUpdateOld')))
        localStorage.setItem('productsCartUpdateOld', JSON.stringify([]))
    const productsCartUpdateOld = JSON.parse(localStorage.getItem('productsCartUpdate'))

    const oldVariantId = cartItem.querySelector('input[name="product_variant_id_old"]').value
    if (!productsCartUpdateOld.length)
        productsCartUpdateOld.push({ product_variant_id: oldVariantId })
    else {
        productsCartUpdateOld.forEach((product, index) => {
            if (variantProductId == product.product_id) {
                productsCartUpdateOld.splice(index, 1)
                productsCartUpdateOld.push({ product_variant_id: oldVariantId })
            }
        })
    }

    localStorage.removeItem('productsCartUpdateOld')
    localStorage.setItem('productsCartUpdateOld', JSON.stringify(productsCartUpdateOld))

    const variantName = variantValue[4]
    const dropdownCart = document.querySelector('.dropdown-cart__content')
    const dropdownCartItems = Array.from(dropdownCart.querySelectorAll('.cart-dropdown__block'))

    dropdownCartItems.forEach(item => {
        let dropdownProductLink = item.querySelector('.cart-dropdown__main')
        let dropdownVariantId = dropdownProductLink.getAttribute('href').split('?')[0].split('/')[2]

        if (oldVariantId == dropdownVariantId) {
            let dropdownVariantName = item.querySelector('.cart-dropdown__variant')
            dropdownVariantName.innerHTML = 'Loại: ' + variantName

            let dropdownPrice = item.querySelector('.cart-dropdown__price')
            if (isNaN(variantDiscount)) {
                dropdownPrice.innerHTML = toCurrency(variantPrice)
            }
            else {
                dropdownPrice.innerHTML = `${toCurrency(parseInt(variantPrice - variantPrice * (variantDiscount / 100)))} <small>${toCurrency(variantPrice)}</small>`
            }
        }
    })
}

// Sự kiện onchange thay đổi số lượng
function changeQuantity(event) {
    const current = event.currentTarget

    const quantity = current.value
    const max = Number(current.max)
    const min = Number(current.min)

    if (quantity > max) {
        current.value = max
        const failModal = document.querySelector('.fail-modal')
        failModal.style.display = 'flex'
        setTimeout(() => failModal.style.display = 'none', 1000)
    }
    else if (quantity < min) {
        current.value = min
        const failModal = document.querySelector('.fail-modal')
        failModal.style.display = 'flex'
        setTimeout(() => failModal.style.display = 'none', 1000)
    }

    const quantityAfter = current.value
    const cartItem = current.parentElement.parentElement
    const variants = cartItem.querySelector('.cart-item__variants')

    const variantId = variants.value.split(',')[0]
    const variantProductId = variants.value.split(',')[3]

    if (!JSON.parse(localStorage.getItem('productsCartUpdate')))
        localStorage.setItem('productsCartUpdate', JSON.stringify([]))
    const productsCartUpdate = JSON.parse(localStorage.getItem('productsCartUpdate'))

    if (!productsCartUpdate.length)
        productsCartUpdate.push({ 'product_id': variantProductId, 'product_variant_id': variantId, 'cart_quantity': quantityAfter })
    else {
        productsCartUpdate.forEach((product, index) => {
            if (variantProductId == product.product_id) {
                productsCartUpdate.splice(index, 1)
                productsCartUpdate.push({ 'product_id': variantProductId, 'product_variant_id': variantId, 'cart_quantity': quantityAfter })
            }
        })
    }

    localStorage.removeItem('productsCartUpdate')
    localStorage.setItem('productsCartUpdate', JSON.stringify(productsCartUpdate))

    if (!JSON.parse(localStorage.getItem('productsCartUpdateOld')))
        localStorage.setItem('productsCartUpdateOld', JSON.stringify([]))
    const productsCartUpdateOld = JSON.parse(localStorage.getItem('productsCartUpdate'))

    if (!productsCartUpdateOld.length)
        productsCartUpdateOld.push({ product_variant_id: cartItem.querySelector('input[name="product_variant_id_old"]').value })
    else {
        productsCartUpdateOld.forEach((product, index) => {
            if (variantProductId == product.product_id) {
                productsCartUpdateOld.splice(index, 1)
                productsCartUpdateOld.push({ product_variant_id: cartItem.querySelector('input[name="product_variant_id_old"]').value })
            }
        })
    }

    localStorage.removeItem('productsCartUpdateOld')
    localStorage.setItem('productsCartUpdateOld', JSON.stringify(productsCartUpdateOld))
}

// Sự kiện onclick nút "Xóa" 1 item
function removeItem(event) {
    const cartItem = event.currentTarget.parentElement.parentElement
    let productVariantId = cartItem.querySelector('input[name="product_variant_id"]')

    if (!JSON.parse(localStorage.getItem('productsCartDelete')))
        localStorage.setItem('productsCartDelete', JSON.stringify([]))
    const productsCartDelete = JSON.parse(localStorage.getItem('productsCartDelete'))

    productsCartDelete.push({
        product_variant_id: Number(productVariantId.value),
    })
    cartItem.remove()

    localStorage.removeItem('productsCartDelete')
    localStorage.setItem('productsCartDelete', JSON.stringify(productsCartDelete))

    const countCartEle = document.querySelector('.header__cart__number-badge')
    countCartEle.innerHTML = Number(countCartEle.innerHTML) - 1

    showEmptyNoti()
    modifyLastItem()
    showSelectedNums()
    deleteDropdown()
    calcTotalPrice()
}

// Tạo sự kiện change cho phần tử
function triggerChangeEvent(element) {
    var event = new Event('change', { bubbles: true })
    element.dispatchEvent(event)
}

// Sự kiện onclick nút giảm số lượng
function minus(event) {
    const input = event.currentTarget.nextElementSibling

    if (input.value > 1) {
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

// Sự kiện onchange tính tiền
function calcPrice(event) {
    if (window.innerWidth > 416) {
        const input = event.currentTarget
        const cartItem = event.currentTarget.parentElement.parentElement
        const unitPriceEle = cartItem.querySelector('.cart-item__unit-price p')
        const unitPrice = unitPriceEle.textContent.slice(0, -1).replaceAll('.', '')
        const priceEle = cartItem.querySelector('.cart-item__price')
        const priceDelEle = cartItem.querySelector('.cart-item__unit-price del')
        const quantity = Number(input.value)

        if (priceDelEle) {
            const priceDel = Number(priceDelEle.textContent.slice(0, -1).replaceAll('.', ''))
            priceEle.innerHTML =
                `<del>${toCurrency(quantity * priceDel)}</del>
            <input type="hidden" name="product_price" value="${quantity * unitPrice}">
            <p>${toCurrency(quantity * unitPrice)}</p>`
        }
        else {
            priceEle.innerHTML =
                `<input type="hidden" name="product_price" value="${quantity * unitPrice}">
            <p>${toCurrency(quantity * unitPrice)}</p>`
        }
    }
}
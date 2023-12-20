// choose comment filter option
function chooseOption(event) {
    const buttons = document.querySelectorAll('.filter__option button')
    buttons.forEach(button => {
        if (button.style.fontWeight == '500') {
            button.style.border = '1px solid var(--outline-gray)'
            button.style.fontWeight = '400'
            button.style.color = 'var(--black)'
        }
    })

    const target = event.currentTarget
    target.style.border = '1px solid var(--dollar-red)'
    target.style.fontWeight = '500'
    target.style.color = 'var(--dollar-red)'
}

// open images modal
function openImageModal(event) {
    const imageModal = document.querySelector('.image-modal')
    imageModal.style.display = 'flex'
}

// show all description
function showAll(event) {
    const button = event.currentTarget
    const description = document.querySelector('.detail--bottom')
    if (description.classList.contains('default')) {
        description.classList.remove('default')
        description.classList.add('full')
        button.innerHTML = 'Ẩn bớt'
    } else if (description.classList.contains('full')) {
        description.classList.remove('full')
        description.classList.add('default')
        button.innerHTML = 'Xem thêm'
    }
}

// Tạo sự kiện change cho phần tử
function triggerChangeEvent(element) {
    var event = new Event('change', {
        bubbles: true
    })
    element.dispatchEvent(event)
}

// Minus quantity
function minus(event) {
    const input = event.currentTarget.nextElementSibling
    input.value = Number(input.value) - 1
    triggerChangeEvent(input)
}

// Plus quantity
function add(event) {
    const input = event.currentTarget.previousElementSibling
    input.value = Number(input.value) + 1
    triggerChangeEvent(input)
}

// Change quantity
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
}

const toCurrency = function (money) {
    let currency = money.toFixed(0).replace(/./g, function (c, i, a) {
        return i > 0 && c !== "," && (a.length - i) % 3 === 0 ? "." + c : c
    })
    return currency + 'đ'
}

// Open cart success modal
const formAddCart = document.getElementById('buy-form')
const addCartBtn = document.querySelector('.detail__add-btn')
const buyNowBtn = document.querySelector('.detail__buy-btn')
const cartSuccessModal = document.querySelector('.success-modal')

formAddCart.addEventListener('submit', (event) => event.preventDefault())

// Sự kiện Spam tỷ lần addCart
let addCartSpam = 0
localStorage.setItem('addCartSpam', JSON.stringify(addCartSpam))

// Cập nhật cart lần đầu tiên, count Cart, list dropdown cart
addCartBtn.addEventListener('click', function firstAddCart (event) {
    const product_variant_id = document.getElementById('product_variant_id').value
    const quantity = document.getElementById('quantity').value

    const cart = {
        'product_variant_id': product_variant_id,
        'cart_quantity': quantity,
    }

    fetch('/order/addCart', {
        method: 'POST',
        body: JSON.stringify(cart),
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(res => res.json())
        .then(back => {
            if (back.status == 'error') {
                window.alert('Vui lòng thử lại sau');
            } else if (back.status == "NotAuth") {
                window.location.href = "/auth/login"
            } else if (back.status == "success") {
                const cartSuccessModal = document.querySelector('.success-modal')
                cartSuccessModal.style.display = 'flex'
                setTimeout(() => {
                    cartSuccessModal.style.display = 'none'
                }, 1000)

                fetch('/general/count_cart', {
                    method: 'GET',
                })
                    .then(res => res.json())
                    .then(countCartData => {
                        const countCartEle = document.querySelector('.header__cart__number-badge')
                        countCartEle.innerHTML = countCartData.countCart

                        const dropdownCart = document.querySelector('.dropdown-cart__content')
                        const cartTitle = dropdownCart.querySelector('.dropdown-cart__content-title')
                        const emptyNoti = dropdownCart.querySelector('.dropdown-cart--empty')
                        const cartBtn = dropdownCart.querySelector('.btn-cart')

                        if (emptyNoti) {
                            emptyNoti.remove()
                            cartTitle.style.visibility = 'visible'
                            cartBtn.style.visibility = 'visible'
                        }

                        fetch('/general/short_cart_list', {
                            method: 'GET',
                        })
                            .then(res => res.json())
                            .then(shortCartListData => {
                                const cartDropdownItem = document.querySelector('.dropdown-cart__content')
                                cartDropdownItem.querySelectorAll('.cart-dropdown__block').forEach(item => {
                                    item.remove()
                                })

                                if (shortCartListData.status == 'success') {
                                    shortCartListData.shortCartList.slice(0, 5).forEach(cartItem => {
                                        let dropdownCartItem = document.createElement('div')
                                        dropdownCartItem.classList.add('cart-dropdown__block')

                                        let cartDropdownPrice
                                        let cartDropdownPriceDel
                                        if (cartItem.discount_amount) {
                                            cartDropdownPrice = toCurrency(Math.round(cartItem.product_variant_price - cartItem.product_variant_price * (cartItem.discount_amount / 100)))
                                            cartDropdownPriceDel = toCurrency(cartItem.product_variant_price)
                                        }
                                        else {
                                            cartDropdownPrice = toCurrency(cartItem.product_variant_price)
                                            cartDropdownPriceDel = ''
                                        }

                                        dropdownCartItem.innerHTML =
                                            `<a href="/search/${cartItem.product_variant_id}?category_id=${cartItem.category_id}" class="cart-dropdown__main">
                                                <img class="cart-dropdown__img" src="/imgs/product_image/P${cartItem.product_id}/${cartItem.product_avt_img}" alt="${cartItem.product_name}">
                                                <div class="cart-dropdown__content">
                                                    <span class="cart-dropdown__product-name">${cartItem.product_name}</span>
                                                    <div class="cart-dropdown__div">
                                                        <span class="cart-dropdown__variant">Loại: ${cartItem.product_variant_name} </span>
                                                        <span class="cart-dropdown__price">${cartDropdownPrice}<small>${cartDropdownPriceDel}</small></span>
                                                    </div>
                                                </div>
                                            </a>`

                                        let cartDropdownTitle = cartDropdownItem.querySelector('.btn-cart')
                                        cartDropdownTitle.before(dropdownCartItem)
                                    })
                                }
                            })
                    })
            }
        })

        // Tặt sự kiện cập nhật cart lần đầu tiên, bật sự kiện checkSpam
        addCartBtn.removeEventListener("click", firstAddCart) 
        // addCartBtn.addEventListener("click", spamAddCart)  
        addCartBtn.addEventListener("click", function spamAddCart () {
            const quantity = document.getElementById('quantity').value
        
            let quantitySpam = Number(JSON.parse(localStorage.getItem('addCartSpam')))
            const cartSuccessModal = document.querySelector('.success-modal')
                cartSuccessModal.style.display = 'flex'
                setTimeout(() => {
                    cartSuccessModal.style.display = 'none'
                }, 1000)
            quantitySpam += Number(quantity)
            localStorage.removeItem('addCartSpam')
            localStorage.setItem('addCartSpam', JSON.stringify(quantitySpam))
            // console.log(JSON.parse(localStorage.getItem('addCartSpam')))
        })

        window.addEventListener("load", async () => {
            const product_variant_id = document.getElementById('product_variant_id').value
            const cart = {
                'product_variant_id': product_variant_id,
                'cart_quantity': Number(JSON.parse(localStorage.getItem('addCartSpam')))
            }
        
            await fetch('/order/addCart', {
                method: 'POST',
                body: JSON.stringify(cart),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
        
            localStorage.removeItem('addCartSpam')
        })

        window.addEventListener("beforeunload", async () => {
            const product_variant_id = document.getElementById('product_variant_id').value
            const cart = {
                'product_variant_id': product_variant_id,
                'cart_quantity': Number(JSON.parse(localStorage.getItem('addCartSpam')))
            }
        
            await fetch('/order/addCart', {
                method: 'POST',
                body: JSON.stringify(cart),
                headers: {
                    'Content-Type': 'application/json'
                }
            })
        
            localStorage.removeItem('addCartSpam')
        })
})





buyNowBtn.addEventListener('click', () => {
    const product_variant_id = document.getElementById('product_variant_id').value
    const quantity = document.getElementById('quantity').value

    const formDataArray = [{
        'product_variant_id': Number(product_variant_id),
        'order_detail_quantity': Number(quantity),
    }]

    let formDataArrayString = JSON.stringify(formDataArray)

    localStorage.setItem('formDataArray', formDataArrayString)
    window.location.href = '/order/information'
})

// Run
const commentImages = document.querySelectorAll('.comment__pictures img')
commentImages.forEach(image => image.addEventListener('click', openImageModal))

// apply css to default comment filter option 
const buttons = document.querySelectorAll('.filter__option button')
buttons[0].style.border = '1px solid var(--dollar-red)'
buttons[0].style.fontWeight = '500'
buttons[0].style.color = 'var(--dollar-red)'
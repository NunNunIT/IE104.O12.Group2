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
    if (description.classList.contains('default-description')) {
        description.classList.remove('default-description')
        description.classList.add('full-description')
        button.innerHTML = 'Ẩn bớt'
    } else if (description.classList.contains('full-description')) {
        description.classList.remove('full-description')
        description.classList.add('default-description')
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
    const input = event.currentTarget
    if (Number(input.value) > Number(input.max))
        input.value = input.max
    else if (Number(input.value) < Number(input.min))
        input.value = input.min
}

// Open cart success modal
const formAddCart = document.getElementById('buy-form')
const addCartBtn = document.querySelector('.detail__add-btn')
const buyNowBtn = document.querySelector('.detail__buy-btn')
const cartSuccessModal = document.querySelector('.success-modal')

addCartBtn.addEventListener('click', () => {
    const product_variant_id = document.getElementById('product_variant_id').value
    const quantity = document.getElementById('quantity').value

    const cart = {
        'product_variant_id': product_variant_id,
        'cart_quantity': quantity,
    }

    fetch("/order/addCart", {
            method: "POST",
            body: JSON.stringify(cart),
            headers: {
                "Content-Type": "application/json"
            }
        })
        .then(res => res.json())
        .then(back => {
            if (back.status == "error") {
                window.alert('Vui lòng thử lại sau');
            } else if (back.status == "success") {
                const cartSuccessModal = document.querySelector('.success-modal')
                cartSuccessModal.style.display = 'flex'
                setTimeout(() => {
                    cartSuccessModal.style.display = 'none'
                    location.reload()
                }, 1500)
            }
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
    window.location.href = 'http://localhost:3000/order/information'
})

// Run
const commentImages = document.querySelectorAll('.comment__pictures img')
commentImages.forEach(image => image.addEventListener('click', openImageModal))

// apply css to default comment filter option 
const buttons = document.querySelectorAll('.filter__option button')
buttons[0].style.border = '1px solid var(--dollar-red)'
buttons[0].style.fontWeight = '500'
buttons[0].style.color = 'var(--dollar-red)'
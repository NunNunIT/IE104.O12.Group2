// Change color when choose variant
document.addEventListener("DOMContentLoaded", function () {
    const variants = document.querySelectorAll('.detail__variant div a')

    // Get the text content of the previously selected variant from localStorage
    const selectedVariantText = localStorage.getItem('selectedVariantText')

    // If there is a previously selected variant, apply the 'variant-selected' class
    if (selectedVariantText) {
        const selectedVariant = Array.from(variants).find(variant => variant.textContent === selectedVariantText)
        if (selectedVariant) {
            selectedVariant.classList.add('variant-selected')
        }
    } else {
        // If no previously selected variant, set the first variant as selected by default
        variants[0].classList.add('variant-selected')
        localStorage.setItem('selectedVariantText', variants[0].textContent)
    }

    variants.forEach(variant => {
        variant.addEventListener('click', (event) => {
            // Remove 'variant-selected' class from all variants
            variants.forEach(other => {
                other.classList.remove('variant-selected')
            })

            // Add 'variant-selected' class to the clicked variant
            variant.classList.add('variant-selected')

            // Save the text content of the clicked variant to localStorage
            localStorage.setItem('selectedVariantText', variant.textContent)
        })
    })
})

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
    }
    else if (description.classList.contains('full-description')) {
        description.classList.remove('full-description')
        description.classList.add('default-description')
        button.innerHTML = 'Xem thêm'
    }
}

// Tạo sự kiện change cho phần tử
function triggerChangeEvent(element) {
    var event = new Event('change', { bubbles: true })
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
const addCartBtn = document.querySelector('.detail__add-btn')
addCartBtn.addEventListener('click', () => {
    const cartSuccessModal = document.querySelector('.success-modal')
    cartSuccessModal.style.display = 'flex'
})

// Run
const commentImages = document.querySelectorAll('.comment__pictures img')
commentImages.forEach(image => image.addEventListener('click', openImageModal))

// apply css to default comment filter option 
const buttons = document.querySelectorAll('.filter__option button')
buttons[0].style.border = '1px solid var(--dollar-red)'
buttons[0].style.fontWeight = '500'
buttons[0].style.color = 'var(--dollar-red)'
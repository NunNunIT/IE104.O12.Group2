// Thêm "active" vào app-bar__element
const appbarEle = document.querySelectorAll('.app-bar__element')
appbarEle[0].classList.add('active')

function calculateDiscountedPrice(originalPrice, discountAmount) {
    return Math.round(originalPrice - originalPrice * (discountAmount / 100))
}

document.addEventListener('DOMContentLoaded', function () {
    const carousel = document.getElementById('cateCarousel')
    const items = document.querySelectorAll('.cate__carousel-col')
    const totalItems = items.length
    const maxItemsDisplay = 7
    let currentIndex = 0

    const prevButton = document.querySelector('#catePrev')
    const nextButton = document.querySelector('#cateNext')
    prevButton.style.display = 'none'

    if (prevButton && nextButton) {
        prevButton.addEventListener('click', showPrev)
        nextButton.addEventListener('click', showNext)
    }

    function showPrev() {
        if (currentIndex !== 0) {
            currentIndex = currentIndex - 1
            updateCarousel()
        }

        if (window.innerWidth > 416) {
            if (currentIndex === 0) {
                prevButton.style.display = 'none'
            }

            if (nextButton.style.display === 'none') {
                nextButton.style.display = 'block'
            }
        }
    }

    function showNext() {
        if ((currentIndex + 1) * maxItemsDisplay < totalItems) {
            currentIndex = currentIndex + 1
            updateCarousel()
        }

        if (window.innerWidth > 416) {
            if (prevButton.style.display === 'none') {
                prevButton.style.display = 'block'
            }

            if ((currentIndex + 1) * maxItemsDisplay >= totalItems) {
                nextButton.style.display = 'none'
            }
        }
    }

    function updateCarousel() {
        const scrollValue = currentIndex * carousel.clientWidth
        carousel.scrollTo({
            left: scrollValue,
            behavior: 'smooth',
        })
    }
})
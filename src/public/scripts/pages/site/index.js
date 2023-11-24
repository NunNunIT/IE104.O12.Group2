// Thêm "active" vào app-bar__element
const appbar__element = document.querySelectorAll('.app-bar__element');
appbar__element[0].classList.add('active');


document.addEventListener('DOMContentLoaded', function () {
    const carousel = document.getElementById('cateCarousel')
    const items = document.querySelectorAll('.cate__item')
    const totalItems = items.length
    const maxItemsDisplay = 5
    let currentIndex = 0

    const prevButton = document.querySelector('#catePrev')
    const nextButton = document.querySelector('#cateNext')
    prevButton.style.display = 'none'

    if (prevButton && nextButton) {
        prevButton.addEventListener('click', showPrev)
        nextButton.addEventListener('click', showNext)
    }

    function showPrev() {
        if (currentIndex != 0) {
            currentIndex = currentIndex - 1
            updateCarousel()
        }

        if (window.innerWidth > 416) {
            if (currentIndex == 0)
                prevButton.style.display = 'none'

            if (nextButton.style.display == 'none')
                nextButton.style.display = 'block'
        }
    }

    function showNext() {
        if ((currentIndex + 1) * maxItemsDisplay < totalItems) {
            currentIndex = currentIndex + 1
            updateCarousel()
        }

        if (window.innerWidth > 416) {
            if (prevButton.style.display == 'none')
                prevButton.style.display = 'block'

            if ((currentIndex + 1) * maxItemsDisplay >= totalItems) {
                nextButton.style.display = 'none'
            }
        }
    }

    function updateCarousel() {
        const transformValue = -currentIndex * 100 + '%'
        carousel.style.transform = `translateX(${transformValue})`
    }
})
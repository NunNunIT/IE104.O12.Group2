document.addEventListener('DOMContentLoaded', function () {
    const carousel = document.querySelector('.image-carousel')
    const items = document.querySelectorAll('.image-carousel__item')
    const background = document.querySelector('.image-background')
    const totalItems = items.length
    const maxItemsDisplay = 1
    let currentIndex = 0

    const prevButton = document.querySelector('#imgModalPrev')
    const nextButton = document.querySelector('#imgModalNext')
    prevButton.style.display = 'none'

    prevButton.addEventListener('click', showPrev)
    nextButton.addEventListener('click', showNext)
    background.addEventListener('click', closeModal)

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

    function closeModal() {
        const modal = document.querySelector('.image-modal')
        modal.style.display = 'none'
        carousel.style.transform = 'none'
        currentIndex = 0
    }
})
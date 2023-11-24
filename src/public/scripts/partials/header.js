let dropdownOpen = false

function isCursorInside(element) {
    var rect = element.getBoundingClientRect()
    return (
        event.clientX >= rect.left &&
        event.clientX <= rect.right &&
        event.clientY >= rect.top &&
        event.clientY <= rect.bottom
    )
}

function showCate() {
    const cateDrop = document.querySelector('.header__cate-dropdown')
    cateDrop.style.display = 'flex'
    dropdownOpen = true
}

function closeCate(event) {
    const cateDrop = document.querySelector('.header__cate-dropdown')
    const cateDiv = document.querySelector('.menu__cate')
    if (!isCursorInside(cateDiv) && !isCursorInside(cateDrop)) {
        cateDrop.style.display = 'none'
        dropdownOpen = false
    }
}

function toggleCate() {
    const cateDrop = document.querySelector('.header__cate-dropdown')
    if (dropdownOpen) {
        cateDrop.style.display = 'none'
        dropdownOpen = false
    } else {
        showCate()
    }
}

const cateDiv = document.querySelector('.menu__cate')
const cateDrop = document.querySelector('.header__cate-dropdown')
cateDiv.addEventListener('mouseover', showCate)
cateDrop.addEventListener('mouseleave', closeCate)
cateDiv.addEventListener('click', toggleCate)
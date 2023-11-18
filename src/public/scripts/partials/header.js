function showCate() {
    const cateDrop = document.querySelector('.header__cate-dopdown')
    cateDrop.style.display = 'flex'
}

function closeCate(event) {
    const cateDrop = document.querySelector('.header__cate-dopdown')

    // Check if the click is outside the dropdown or the menu__cate element
    if (!cateDrop.contains(event.target) && event.target !== cateDiv) {
        cateDrop.style.display = 'none'
    }
}

const cateDiv = document.querySelector('.menu__cate')
cateDiv.addEventListener('mouseover', showCate)
cateDiv.addEventListener('mouseout', closeCate)
document.addEventListener('mousedown', closeCate)
function checkAll(event) {
    const checkboxes = document.querySelectorAll('.checkbox')
    checkboxes.forEach(checkbox => checkbox.checked = event.currentTarget.checked)

    changeDel()
}

function checkAllBtn(event) {
    const checkAll = document.querySelector('#check-all')
    const checkboxes = document.querySelectorAll('.checkbox')

    checkAll.checked = !checkAll.checked
    checkboxes.forEach(checkbox => checkbox.checked = checkAll.checked)

    changeDel()
}

function deleteAllItem(event) {
    const checkboxes = [...document.querySelectorAll('.checkbox')].slice(1)
    checkboxes.forEach(checkbox => {
        if (checkbox.checked == true)
            checkbox.parentNode.remove()
    })
    showEmptyNoti()
}

function changeDel() {
    const delBtn = document.querySelector('#del-btn')
    if ([...document.querySelectorAll('.checkbox')].some(checkbox => checkbox.checked == true)) {
        delBtn.style.background = 'var(--dollar-red)'
        delBtn.style.color = 'var(--white)'
    }
    else {
        delBtn.style.removeProperty('background')
        delBtn.style.removeProperty('color')
    }
}

function showEmptyNoti() {
    const numCartItem = [...document.querySelectorAll('.cart-item.mobile-hidden')].length
    const numCartItemMobile = [...document.querySelectorAll('.cart-item.mobile-display')].length
    if (numCartItem == 0 || numCartItemMobile == 0) {
        const emptyNoti = document.querySelector('.cart__empty')
        emptyNoti.style.display = 'flex'
    }
}

const cartMbHiddenItems = [...document.querySelectorAll('.cart-item.mobile-hidden')]
const lastMbHiddenChild = cartMbHiddenItems[cartMbHiddenItems.length - 1]
lastMbHiddenChild.style.border = 'none'
lastMbHiddenChild.style.padding = '0'

const cartMbDisplayItems = [...document.querySelectorAll('.cart-item.mobile-display')]
const lastMbDisplayChild = cartMbDisplayItems[cartMbDisplayItems.length - 1]
lastMbDisplayChild.style.border = 'none'
lastMbDisplayChild.style.padding = '0'
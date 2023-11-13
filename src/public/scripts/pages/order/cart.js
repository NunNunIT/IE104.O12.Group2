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
    const numCartItem = [...document.querySelectorAll('.cart-item')].length
    if (numCartItem == 0) {
        const emptyNoti = document.querySelector('.cart__empty')
        emptyNoti.style.display = 'flex'
    }
}
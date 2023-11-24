// Sự kiện onclick checkbox chọn 1 item
function checkOne(event) {
    const checkAll = document.getElementById('check-all')
    if (event.currentTarget.checked == false)
        checkAll.checked = false

    let checkboxes
    if (window.innerWidth <= 416)
        checkboxes = document.querySelectorAll('.checkbox.mobile-display')
    else
        checkboxes = document.querySelectorAll('.checkbox.mobile-hidden')

    if (Array.from(checkboxes).filter(checkbox => checkbox.checked == false).length == 0)
        checkAll.checked = true

    showSelectedNums()
    changeDel()
}

// Sự kiện onclick nút "Xóa" 1 item
function removeItem(event) {
    const cartItem = event.currentTarget.parentElement.parentElement
    console.log(cartItem)
    cartItem.remove()

    showSelectedNums()
    showEmptyNoti()
}

// Sự kiện onclick nút giảm số lượng
function minus(event) {
    const input = event.currentTarget.nextElementSibling

    if (input.value > 0)
        input.value = Number(input.value) - 1
}

// Sự kiện onclick nút tăng số lượng
function add(event) {
    const input = event.currentTarget.previousElementSibling
    input.value = Number(input.value) + 1
}
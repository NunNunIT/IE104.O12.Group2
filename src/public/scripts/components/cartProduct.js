function checkOne(event) {
    const checkAll = document.getElementById('check-all')
    if (event.currentTarget.checked == false)
        checkAll.checked = false

    const checkboxes = document.querySelectorAll('.checkbox')
    if ([...checkboxes].filter(checkbox => checkbox.checked == false).length == 1)
        checkAll.checked = true

    changeDel()
}

function minus(event) {
    const input = event.currentTarget.nextElementSibling

    if (input.value > 0)
        input.value = Number(input.value) - 1
}

function add(event) {
    const input = event.currentTarget.previousElementSibling
    input.value = Number(input.value) + 1
}

function removeItem(event) {
    const cartItem = event.currentTarget.parentElement.parentElement
    console.log(cartItem)
    cartItem.remove()

    showEmptyNoti()
}

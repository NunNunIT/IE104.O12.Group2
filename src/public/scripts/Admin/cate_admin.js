// check checkbox
const checkboxAll = document.querySelector('.checkbox')
const checkboxes = Array.from(document.querySelectorAll('.checkbox')).slice(1)

checkboxAll.addEventListener('click', checkAll)
checkboxes.forEach(checkbox => checkbox.addEventListener('click', checkOne))

function checkAll() {
    checkboxes.forEach(checkbox => checkbox.checked = checkboxAll.checked)
}

function checkOne(event) {
    checkboxAll.checked = checkboxes.every(checkbox => checkbox.checked)
}
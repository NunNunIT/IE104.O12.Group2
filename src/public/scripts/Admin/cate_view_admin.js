// add another variant or detail
const addAnotherBtn = Array.from(document.querySelectorAll('.add-another-btn'))

addAnotherBtn.forEach(btn => {
    btn.addEventListener('click', addAnother)
})

function addAnother(event) {
    const current = event.currentTarget
    const lastItem = Array.from(current.previousElementSibling.children).slice(-1)[0]
    const newLastItem = lastItem.cloneNode(true)

    lastItem.after(newLastItem)
}
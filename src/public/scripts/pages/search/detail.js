// variants
function chooseOption(event) {
    const buttons = document.querySelectorAll('.filter__option button')
    buttons.forEach(button => {
        if (button.style.fontWeight == '500') {
            button.style.border = '1px solid var(--outline-gray)'
            button.style.fontWeight = '400'
            button.style.color = 'var(--black)'
        }
    })

    const target = event.currentTarget
    target.style.border = '1px solid var(--dollar-red)'
    target.style.fontWeight = '500'
    target.style.color = 'var(--dollar-red)'
}
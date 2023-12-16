const menuItem = Array.from(document.querySelectorAll('.menu__item')).slice(-3)

const activeMenuItem = localStorage.getItem('activeMenuItem')
menuItem.forEach(item => {
    item.addEventListener('click', () => {
        localStorage.removeItem('activeMenuItem')
        localStorage.setItem('activeMenuItem', item.className)
    })

    if (item.className == activeMenuItem) {
        item.classList.add('active-menu-item')
        menuItem.forEach(ele => {
            if (ele != item)
                ele.classList.remove('active-menu-item')
        })
    }
})

// for menu__item localStorge
const url = location.href
if (url != 'http://localhost:3000/search/results?hotProduct=true' && url != 'http://127.0.0.1:3000/search/results?hotProduct=true'
    && url != 'http://localhost:3000/search/results?discount=true' && url != 'http://127.0.0.1:3000/search/results?discount=true'
    && url != 'http://localhost:3000/about-us' && url != 'http://127.0.0.1:3000/about-us') {
    if (activeMenuItem) {
        let activeItem = document.querySelector(`.${activeMenuItem.replaceAll(' ', '.')}`)
        activeItem.classList.remove('active-menu-item')
    }
}
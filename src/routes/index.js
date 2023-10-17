// import router
const siteRouter = require('./siteRouter')

function route(app) {
    // test product
    app.use('/', (req, res) => {
        const productList = {
            'cooker': 'Nồi cơm điện',
            'fan': 'Quạt điện',
            'fridge': 'Tủ lạnh',
            'television': 'Ti vi',
            'water-purifier': 'Máy lọc nước',
            'induction-cooker': 'Bếp từ'
        }

        res.render('./pages/index', { productList })
    })

    app.use('/', siteRouter)
}

module.exports = route
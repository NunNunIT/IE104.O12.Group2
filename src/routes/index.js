// import router
const siteRouter = require('./siteRouter')
const productRouter = require('./productRouter')

function route(app) {
    //push code lên thì xóa 2 dòng dưới này
    app.use('/product-item', (req, res) => { res.render('./components/product-item.ejs') })
    app.use('/header', (req, res) => { res.render('./partials/header.ejs') })

    app.use('/product', productRouter)
    app.use('/', siteRouter)
}

module.exports = route
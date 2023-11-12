// import router
const siteRouter = require('./siteRouter')
const productRouter = require('./productRouter')
const notificationsRouter = require('./notificationsRouter')
const accountRouter = require('./accountRouter')

function route(app) {
    app.use('/order-info', (req, res) => res.render('./pages/order-information'))
    app.use('/cart', (req, res) => res.render('./pages/cart'))
    app.use('/notifications', notificationsRouter)
    app.use('/account', accountRouter)
    app.use('/product', productRouter)
    app.use('/', siteRouter)
}

module.exports = route
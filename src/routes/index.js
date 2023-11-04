// import router
const siteRouter = require('./siteRouter')
const productRouter = require('./productRouter')
const notificationsRouter = require('./notificationsRouter')

function route(app) {
    app.use('/notifications', notificationsRouter)
    app.use('/product', productRouter)
    app.use('/', siteRouter)
}

module.exports = route
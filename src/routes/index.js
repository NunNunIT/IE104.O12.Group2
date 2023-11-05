// import router
const siteRouter = require('./siteRouter')
const productRouter = require('./productRouter')
const notificationsRouter = require('./notificationsRouter')
const accountRouter = require('./accountRouter')

function route(app) {
    app.use('/notifications', notificationsRouter)
    app.use('/account', accountRouter)
    app.use('/product', productRouter)
    app.use('/', siteRouter)
}

module.exports = route
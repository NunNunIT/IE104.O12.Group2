// import router
const siteRouter = require('./siteRouter')
const notificationRouter = require('./notificationRouter')
const accountRouter = require('./accountRouter')
const authRouter = require('./authRouter')
const orderRouter = require('./orderRouter')
const searchRouter = require('./searchRouter')

function route(app) {
    app.use('/search', searchRouter)
    app.use('/order', orderRouter)
    app.use('/auth', authRouter)
    app.use('/notification', notificationRouter)
    app.use('/account', accountRouter)
    app.use('/', siteRouter)
}

module.exports = route
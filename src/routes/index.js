// import router
const siteRouter = require('./siteRouter')
const adminRouter = require('./adminRouter')
const productRouter = require('./productRouter')

function route(app) {

    app.use('/admin', adminRouter)
    app.use('/product', productRouter)
    app.use('/', siteRouter)
}

module.exports = route
// import router
const siteRouter = require('./siteRouter')
const productRouter = require('./productRouter')

function route(app) {

    app.use('/product', productRouter)
    app.use('/', siteRouter)


}

module.exports = route
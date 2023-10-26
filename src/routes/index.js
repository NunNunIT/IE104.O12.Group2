// import router
const siteRouter = require('./siteRouter')
const productRouter = require('./productRouter')

function route(app) {

    app.use('/appbar', (req, res) => { res.render('./partials/app-bar.ejs') })
    app.use('/footer', (req, res) => { res.render('./partials/footer.ejs') })

    app.use('/product', productRouter)
    app.use('/', siteRouter)
    

}

module.exports = route
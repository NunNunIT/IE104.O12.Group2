// import router
const siteRouter = require('./siteRouter')

function route(app) {
    app.use('/footer', (req, res) => { res.render('./partials/footer') })
    app.use('/', siteRouter)
}

module.exports = route
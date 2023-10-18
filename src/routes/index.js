// import router
const siteRouter = require('./siteRouter')

function route(app) {
    app.use('/header', (req, res) => { res.render('./partials/header') })
    app.use('/', siteRouter)
}

module.exports = route
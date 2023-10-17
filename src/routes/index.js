// import router
const siteRouter = require('./siteRouter')

function route(app) {
    app.use('/', siteRouter)
}

module.exports = route
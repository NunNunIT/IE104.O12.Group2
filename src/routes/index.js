// import router
const site = require('./site')

function route(app) {
    app.use('/', site)
}

module.exports = route
// import router
const siteRouter = require('./siteRouter')

function route(app) {
    app.use('/slider', (req, res)=> {
        res.render('./components/slider')
    })
    app.use('/', siteRouter)
}

module.exports = route
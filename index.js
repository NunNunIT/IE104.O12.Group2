// import lib
const ejs = require('ejs');
const path = require('path')
const express = require('express')

// connect to db


const app = express()
const cfg = require('./src/config/index')
const route = require('./src/routes/index.js')

// set view engine
app.set('views', path.join(__dirname, 'src', 'views', 'pages'));
app.set('view engine', 'ejs');

// use static folder
app.use(express.static(path.join('src', 'public')))

// route init
route(app)

app.listen(cfg.port, () => {
    console.log(`App is running at http://${cfg.host}:${cfg.port}`)
})
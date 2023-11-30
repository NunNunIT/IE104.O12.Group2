// import lib
const ejs = require('ejs');
const path = require('path')
const express = require('express')
const util = require('util')
const app = express()
const dotdenv = require('dotenv').config();
const bodyParser = require('body-parser')
const cookieParser = require('cookie-parser')

// connect to db
const db = require('./src/config/db/connect');
const query = util.promisify(db.query).bind(db)

const cfg = require('./src/config/index')
const route = require('./src/routes/index')

// set view engine
app.set('views', path.join(__dirname, 'src', 'views'));
app.set('view engine', 'ejs');

// use static folder
app.use(express.static(path.join('src', 'public')))

//parse URL-encoded bodies
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }))
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser('secret'))

//app.use('/', require('./routes/index'))

// route init
route(app)

app.listen(cfg.port, () => {
    console.log(`Website is running at http://${cfg.host}:${cfg.port}`)
})
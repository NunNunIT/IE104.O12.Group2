const express = require('express')
const router = express.Router();

// import controller
const site = require('../controllers/SiteController.js')

router.get('/', site.index)

module.exports = router
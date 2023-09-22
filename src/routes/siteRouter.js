const express = require('express')
const router = express.Router();

// import controller
const siteController = require('../controllers/SiteController.js')

router.get('/', siteController.index)

module.exports = router
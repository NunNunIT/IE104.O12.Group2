const express = require('express')
const router = express.Router()

// import controller
const SiteController = require('../controllers/SiteController.js')

router.get('/', SiteController.index)

module.exports = router

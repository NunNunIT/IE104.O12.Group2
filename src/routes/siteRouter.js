const express = require('express')
const router = express.Router()

var parseUrl = require('body-parser')

// import controller
const siteController = require('../controllers/customer/siteController.js')

// import middleware
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/category', siteController.category)
router.get('/about-us', siteController.aboutUs)
router.get('/privacy-policy', siteController.privacyPolicy)
router.get('/error', siteController.error)
router.get('/', siteController.index)

module.exports = router

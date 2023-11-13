const express = require('express')
const router = express.Router()

// import controller
const SiteController = require('../controllers/SiteController.js')

router.get('/about-us', SiteController.aboutUs);
router.get('/privacy-policy', SiteController.privacyPolicy);
router.get('/error', SiteController.error);
router.get('/', SiteController.index)

module.exports = router

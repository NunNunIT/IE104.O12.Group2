const express = require('express')
const router = express.Router()

var parseUrl = require('body-parser');
let encodeUrl = parseUrl.urlencoded({ extended: false });

// import controller
const siteController = require('../controllers/customer/SiteController.js')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/about-us', authMiddleware.getLoggedIn, siteController.aboutUs);
router.get('/privacy-policy', authMiddleware.getLoggedIn, siteController.privacyPolicy);
router.get('/error', authMiddleware.getLoggedIn, siteController.error);
router.get('/', authMiddleware.getLoggedIn, siteController.index);

module.exports = router

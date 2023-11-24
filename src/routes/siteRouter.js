const express = require('express')
const router = express.Router()

var parseUrl = require('body-parser');
let encodeUrl = parseUrl.urlencoded({ extended: false });

// import controller
const SiteController = require('../controllers/SiteController.js')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/about-us', authMiddleware.getLoggedIn, SiteController.aboutUs);
router.get('/privacy-policy', authMiddleware.getLoggedIn, SiteController.privacyPolicy);
router.get('/error', authMiddleware.getLoggedIn, SiteController.error);
router.get('/', authMiddleware.getLoggedIn, SiteController.index);
router.post('/', authMiddleware.isLoggedIn, encodeUrl, SiteController.indexPost);

module.exports = router

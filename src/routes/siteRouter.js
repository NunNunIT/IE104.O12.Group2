const express = require('express')
const router = express.Router()

var parseUrl = require('body-parser');
let encodeUrl = parseUrl.urlencoded({ extended: false });

// import controller
const SiteController = require('../controllers/SiteController.js')
const Middleware = require('../middleware/authMiddleware.js')

router.get('/about-us', SiteController.aboutUs);
router.get('/privacy-policy', SiteController.privacyPolicy);
router.get('/error', SiteController.error);
router.get('/', SiteController.index);
router.post('/', Middleware.isLoggedIn, encodeUrl, SiteController.indexPost);
// router.get('/', Middleware.checkAuth, SiteController.index);
module.exports = router

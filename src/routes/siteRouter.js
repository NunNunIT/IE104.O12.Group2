const express = require('express')
const router = express.Router();

// import controller
const SiteController = require('../controllers/SiteController.js')

router.get('/register', SiteController.register)
router.post('/register', SiteController.submitRegister)
router.get('/login', SiteController.login)
router.post('/login', SiteController.submitLogin)
router.get('/search-results', SiteController.search);
router.get('/account', SiteController.account);
router.get('/about-us', SiteController.aboutUs);
router.get('/privacy-policy', SiteController.privacyPolicy);
router.get('/error', SiteController.error);
router.get('/', SiteController.index)

module.exports = router
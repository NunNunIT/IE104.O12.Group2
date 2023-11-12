const express = require('express');
const router = express.Router();

// import controller
const SiteController = require('../controllers/SiteController.js');

router.get('/register', SiteController.register)
router.post('/register', SiteController.submitRegister)
router.get('/login', SiteController.login)
router.post('/login', SiteController.submitLogin)
router.get('/search-results', SiteController.search);
router.get('/forgot-password', SiteController.forgotPassword);
router.get('/reset-password', SiteController.resetPassword);
router.get('/transaction', SiteController.transaction);
router.get('/momo', SiteController.momo);
router.get('/atm', SiteController.atm);
router.get('/credit', SiteController.credit);
router.get('/', SiteController.index)

module.exports = router;

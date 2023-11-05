const express = require('express')
const router = express.Router();

// import controller
const SiteController = require('../controllers/SiteController.js')

router.get('/product-detail', SiteController.productDetail)
router.get('/forgot-password', SiteController.forgotPassword)
router.get('/reset-password', SiteController.resetPassword)
router.get('/transaction', SiteController.transaction)
router.get('/', SiteController.index)

module.exports = router
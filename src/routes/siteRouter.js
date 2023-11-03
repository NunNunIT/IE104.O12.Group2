const express = require('express')
const router = express.Router();

// import controller
const SiteController = require('../controllers/SiteController.js')

router.post('/register', SiteController.submitRegister)

router.get('/register', SiteController.register)

router.get('/product-detail', SiteController.productDetail)

router.get('/', SiteController.index)

module.exports = router
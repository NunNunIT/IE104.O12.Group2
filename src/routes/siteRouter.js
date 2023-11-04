const express = require('express')
const router = express.Router();

// import controller
const SiteController = require('../controllers/SiteController.js')

router.get('/search-results', SiteController.search);
router.get('/product-detail', SiteController.productDetail)
router.get('/', SiteController.index)

module.exports = router
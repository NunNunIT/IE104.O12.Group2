const express = require('express')
const router = express.Router()

// import controller
const generalController = require('../controllers/generalController')

// import middleware
const authMiddleware = require('../middleware/authMiddleware.js')

// [GET] /general/product_variant_info?product_variant_id=x
router.get('/product_variant_info', generalController.getProductVariantInfo)

// [GET] /general/count_cart
router.get('/count_cart', authMiddleware.isLoggedIn, generalController.getCountCart)

module.exports = router
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

// [GET] /general/short_cart_list
router.get('/short_cart_list', authMiddleware.isLoggedIn, generalController.getShortCartList)

// [POST] /general/check_cart
router.get('/check_cart', authMiddleware.isLoggedIn, generalController.getShortCartList)

module.exports = router
const express = require('express')
const router = express.Router();

// import controller
const ProductController = require('../controllers/ProductController.js')

router.get('/detail/:productId', ProductController.detail)

module.exports = router
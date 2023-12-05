const express = require('express')
const router = express.Router();

// import controller
const searchController = require('../controllers/customer/searchController.js')

// import middleware
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/results',authMiddleware.getLoggedIn, searchController.results)
router.get('/:product_variant_id', authMiddleware.getLoggedIn, searchController.detail)

module.exports = router
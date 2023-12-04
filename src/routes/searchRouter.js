const express = require('express')
const router = express.Router();

// import controller
const searchController = require('../controllers/customer/searchController.js')

// import middleware
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/results', searchController.results)
router.get('/:product_variant_id', searchController.detail)

module.exports = router
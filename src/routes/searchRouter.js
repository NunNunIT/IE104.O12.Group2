const express = require('express')
const router = express.Router();

// import controller
const SearchController = require('../controllers/customer/SearchController.js')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/results', authMiddleware.getLoggedIn, SearchController.results)
router.get('/:productId', authMiddleware.getLoggedIn, SearchController.detail)

module.exports = router
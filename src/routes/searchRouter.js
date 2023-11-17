const express = require('express')
const router = express.Router();

// import controller
const SearchController = require('../controllers/SearchController.js')

router.get('/results', SearchController.results)
router.get('/:productId', SearchController.detail)

module.exports = router
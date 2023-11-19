const express = require('express')
const router = express.Router();

// import controller
const testController = require('../controllers/test.Controller.js')

router.get('/:productId', testController.detail)

module.exports = router
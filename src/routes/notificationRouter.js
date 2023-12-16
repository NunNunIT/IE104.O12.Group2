const express = require('express')
const router = express.Router()

// import controller
const notificationController = require('../controllers/customer/notificationController')

// import middleware
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/order', authMiddleware.isLoggedIn, notificationController.accountUpdate)
router.get('/promotion', authMiddleware.isLoggedIn, notificationController.promotion)

module.exports = router
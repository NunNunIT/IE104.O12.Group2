const express = require('express')
const router = express.Router()

// import controller
const notificationController = require('../controllers/customer/notificationController')

// import middleware
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/order', authMiddleware.isLoggedIn, notificationController.order)
router.get('/promotion', authMiddleware.isLoggedIn, notificationController.promotion)

router.post('/read-noti', authMiddleware.isLoggedIn, notificationController.readNotification)
router.post('/read-all', authMiddleware.isLoggedIn, notificationController.readAllNotifications)

module.exports = router
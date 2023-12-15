const express = require('express')
const router = express.Router()

// import controller
const notificationController = require('../controllers/customer/notificationController')

// import middleware
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/account-update', authMiddleware.isLoggedIn, notificationController.accountUpdate)
router.get('/promotion', authMiddleware.isLoggedIn, notificationController.promotion)

router.post('/read-noti', authMiddleware.isLoggedIn, notificationController.readNotification)
router.post('/read-all', authMiddleware.isLoggedIn, notificationController.readAllNotifications)

module.exports = router
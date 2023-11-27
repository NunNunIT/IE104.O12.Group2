const express = require('express')
const router = express.Router();

// import controller
const NotificationController = require('../controllers/customer/NotificationController')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/account-update', authMiddleware.isLoggedIn, NotificationController.accountUpdate);
router.get('/promotion', authMiddleware.isLoggedIn, NotificationController.promotion);

module.exports = router
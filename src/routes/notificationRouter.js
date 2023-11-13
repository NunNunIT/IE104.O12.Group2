const express = require('express')
const router = express.Router();

// import controller
const NotificationController = require('../controllers/NotificationController.js')

router.get('/account-update', NotificationController.accountUpdate);
router.get('/promotion', NotificationController.promotion);

module.exports = router
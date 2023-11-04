const express = require('express')
const router = express.Router();

// import controller
const NotificationsController = require('../controllers/NotificationsController.js')

router.get('/account-update', NotificationsController.accountUpdate);
router.get('/promotion', NotificationsController.promotion);

module.exports = router
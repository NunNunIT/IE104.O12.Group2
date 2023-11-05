const express = require('express')
const router = express.Router();

// import controller
const AccountController = require('../controllers/AccountController.js')

router.get('/purchase/:purchaseID', AccountController.purchaseDetail);
router.get('/purchase', AccountController.purchase);


module.exports = router
const express = require('express')
const router = express.Router()

// import controller
const AccountController = require('../controllers/AccountController')

router.get('/information', AccountController.information)
router.get('/purchase', AccountController.purchaseHistory)
router.get('/purchase/:purchaseID', AccountController.purchaseDetail)
router.get('/warranty-claim', AccountController.warrantyClaim)

module.exports = router
const express = require('express')
const router = express.Router()

// import controller
const AccountController = require('../controllers/AccountController')
const Middleware = require('../middleware/authMiddleware.js')

router.get('/information', Middleware.isLoggedIn, AccountController.information)
router.get('/purchase', AccountController.purchaseHistory)
router.get('/purchase/:purchaseID', AccountController.purchaseDetail)
router.get('/warranty-claim', AccountController.warrantyClaim)

module.exports = router
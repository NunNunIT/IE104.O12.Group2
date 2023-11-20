const express = require('express')
const router = express.Router()

// import controller
const AccountController = require('../controllers/AccountController')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/information', authMiddleware.isLoggedIn, AccountController.information)
router.get('/purchase', authMiddleware.isLoggedIn, AccountController.purchaseHistory)
router.get('/purchase/:purchaseID', authMiddleware.isLoggedIn, AccountController.purchaseDetail)
router.get('/feedback', AccountController.feedback)
router.get('/warranty-claim', AccountController.warrantyClaim)

module.exports = router
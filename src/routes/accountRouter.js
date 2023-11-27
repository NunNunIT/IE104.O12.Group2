const express = require('express')
const router = express.Router()

// import controller
const AccountController = require('../controllers/customer/AccountController')
const authMiddleware = require('../middleware/authMiddleware.js')

router.post('/checkUser', AccountController.checkUser)
router.get('/information', authMiddleware.isLoggedIn, AccountController.information)
router.get('/purchase', authMiddleware.isLoggedIn, AccountController.purchaseHistory)
router.get('/purchase/:purchaseID', authMiddleware.isLoggedIn, AccountController.purchaseDetail)
router.get('/feedback', authMiddleware.isLoggedIn, AccountController.feedback)
router.get('/warranty-claim', authMiddleware.isLoggedIn, AccountController.warrantyClaim)
router.get('/edit-information', authMiddleware.isLoggedIn, AccountController.editInformation)
router.get('/mobile-account', authMiddleware.isLoggedIn, AccountController.mobileAccount)
router.get('/changePassword', AccountController.changePassword)


module.exports = router
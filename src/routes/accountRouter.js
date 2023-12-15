const express = require('express')
const router = express.Router()

// import controller
const accountController = require('../controllers/customer/accountController')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/information', authMiddleware.isLoggedIn, accountController.information)
router.get('/edit-information', authMiddleware.isLoggedIn, accountController.getEditInformation)
router.post('/edit-information', authMiddleware.isLoggedIn, accountController.editInformation)
router.get('/purchase', authMiddleware.isLoggedIn, accountController.purchaseHistory)
router.get('/purchase/:order_id', authMiddleware.isLoggedIn, accountController.purchaseDetail)
router.get('/feedback', authMiddleware.isLoggedIn, accountController.feedback)
router.post('/feedback', authMiddleware.isLoggedIn, accountController.sendFeedback)
router.get('/warranty-claim', authMiddleware.isLoggedIn, accountController.warrantyClaim)
router.get('/mobile-account', authMiddleware.isLoggedIn, accountController.mobileAccount)
router.get('/changePassword', authMiddleware.isLoggedIn, accountController.changePassword)

module.exports = router
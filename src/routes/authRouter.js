const express = require('express')
const router = express.Router()

// import controller
const authController = require('../controllers/customer/authController')

// import middleware
const middleware = require('../middleware/authMiddleware')

router.get('/register', middleware.checkAuth, authController.register)
router.post('/register', middleware.checkAuth, authController.submitRegister)
router.get('/login', middleware.checkAuth, authController.login)
router.post('/login', middleware.checkAuth, authController.submitLogin)
router.get('/logout', middleware.checkUnAuth, authController.logout)
router.get('/forgot', authController.forgotPassword)
router.post('/forgot', authController.forgotPasswordPost)
router.get('/reset', authController.resetPassword)
// router.get('/resetAuth', authController.resetPasswordAuth)

module.exports = router
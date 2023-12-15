const express = require('express')
const router = express.Router()

// import controller
const authController = require('../controllers/customer/authController.js')

// import middleware
const middleware = require('../middleware/authMiddleware')

router.post('/findUser', authController.findUser)
router.get('/register', middleware.checkAuth, authController.register)
router.post('/register', middleware.checkAuth, authController.submitRegister)
router.get('/login', middleware.checkAuth, authController.login)
router.post('/login', middleware.checkAuth, authController.submitLogin)
router.get('/logout', middleware.checkUnAuth, authController.logout)
router.get('/forgot', authController.forgotPassword)
router.post('/forgot', authController.forgotPasswordPost)
router.post('/reset', authController.resetPassword)
// router.get('/resetAuth', authController.resetPasswordAuth)

router.post('/changePass', middleware.isLoggedIn, authController.changePassPost);

module.exports = router
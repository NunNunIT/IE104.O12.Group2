const express = require('express')
const router = express.Router()

// import controller
const AuthController = require('../controllers/AuthController')
const middleware = require('../middleware/authMiddleware')

router.get('/register', middleware.checkAuth, AuthController.register)
router.post('/register', middleware.checkAuth, AuthController.submitRegister)
router.get('/login', middleware.checkAuth, AuthController.login)
router.post('/login', middleware.checkAuth, AuthController.submitLogin)
router.get('/logout', middleware.checkUnAuth, AuthController.logout)
router.get('/forgot', AuthController.forgotPassword)
router.post('/forgot', AuthController.forgotPasswordPost)
router.get('/reset', AuthController.resetPassword)
// router.get('/resetAuth', AuthController.resetPasswordAuth)

module.exports = router
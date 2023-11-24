const express = require('express')
const router = express.Router()

// import controller
const AuthController = require('../controllers/AuthController')
const Middleware = require('../middleware/authMiddleware')

router.get('/register', AuthController.register)
router.post('/register', AuthController.submitRegister)
router.get('/login', AuthController.login)
router.post('/login', AuthController.submitLogin)
router.get('/logout', AuthController.logout)
router.get('/forgot', AuthController.forgotPassword)
router.post('/forgot', AuthController.forgotPasswordPost)
router.get('/reset', AuthController.resetPassword)

module.exports = router
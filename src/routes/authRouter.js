const express = require('express')
const router = express.Router()

// import controller
const AuthController = require('../controllers/AuthController')

router.get('/register', AuthController.register)
router.post('/register', AuthController.submitRegister)
router.get('/login', AuthController.login)
router.post('/login', AuthController.submitLogin)
router.get('/forgot', AuthController.forgotPassword)
router.get('/reset', AuthController.resetPassword)

module.exports = router
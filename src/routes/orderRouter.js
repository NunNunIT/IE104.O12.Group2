const express = require("express");
const router = express.Router();

// import controller
const orderController = require('../controllers/customer/orderController.js')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/cart', authMiddleware.isLoggedIn, orderController.cart)
router.post('/cart/delete', authMiddleware.isLoggedIn, orderController.deleteCart)
router.post('/addCart', authMiddleware.isLoggedIn, orderController.addCart)

router.get('/information', authMiddleware.isLoggedIn, orderController.information)
router.post('/information', authMiddleware.isLoggedIn, orderController.informationPost)

router.get('/payment', authMiddleware.isLoggedIn, orderController.payment)

// router.get('/momo', authMiddleware.isLoggedIn, orderController.momo)
// router.post('/momo', authMiddleware.isLoggedIn, orderController.momo)

// router.get('/atm', authMiddleware.isLoggedIn, orderController.atm)
// router.post('/atm', authMiddleware.isLoggedIn, orderController.atm)

// router.get('/credit', authMiddleware.isLoggedIn, orderController.credit)
// router.post('/credit', authMiddleware.isLoggedIn, orderController.credit)

module.exports = router;

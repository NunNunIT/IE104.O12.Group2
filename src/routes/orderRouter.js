const express = require("express");
const router = express.Router();

// import controller
const orderController = require('../controllers/customer/orderController.js')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/cart', authMiddleware.isLoggedIn, orderController.cart)
router.post('/cart/delete', authMiddleware.isLoggedIn, orderController.deleteCart)
router.post('/addCart', authMiddleware.getLoggedIn, orderController.addCart)
router.post('/updateCart', authMiddleware.getLoggedIn, orderController.updateCart)

router.get('/information', authMiddleware.isLoggedIn, orderController.information)
router.post('/information', authMiddleware.isLoggedIn, orderController.informationPost)

router.get('/payment', authMiddleware.isLoggedIn, orderController.payment)
router.post('/cancel_order', authMiddleware.isLoggedIn, orderController.cancelOrder)

module.exports = router;

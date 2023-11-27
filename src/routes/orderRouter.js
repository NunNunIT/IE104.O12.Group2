const express = require("express");
const router = express.Router();

// import controller
const orderController = require('../controllers/customer/orderController.js')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/cart', authMiddleware.isLoggedIn, orderController.cart)
router.post('/cart', authMiddleware.isLoggedIn, (req, res) => { })
router.post('/addCart', authMiddleware.isLoggedIn, orderController.addCart )

router.get('/information', authMiddleware.isLoggedIn, orderController.information)
router.post('/information', authMiddleware.isLoggedIn, orderController.informationPost)

router.get('/transaction', authMiddleware.isLoggedIn, orderController.transaction)
router.get('/momo', authMiddleware.isLoggedIn, orderController.momo)
router.get('/atm', authMiddleware.isLoggedIn, orderController.atm)
router.get('/credit', authMiddleware.isLoggedIn, orderController.credit)

module.exports = router;

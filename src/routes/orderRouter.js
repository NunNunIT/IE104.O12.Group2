const express = require("express");
const router = express.Router();

// import controller
const OrderController = require('../controllers/customer/OrderController')
const authMiddleware = require('../middleware/authMiddleware.js')

router.get('/cart', authMiddleware.isLoggedIn, OrderController.cart)
router.post('/cart', authMiddleware.isLoggedIn, (req, res) => {
    // res.send(1)
    console.log(req.body)
    // res.redirect('/')
    // res.writeHead(302, { 'Location': '/order/information' })
})

router.get('/information', authMiddleware.isLoggedIn, OrderController.information)
router.get('/transaction', authMiddleware.isLoggedIn, OrderController.transaction)
router.get('/momo', authMiddleware.isLoggedIn, OrderController.momo)
router.get('/atm', authMiddleware.isLoggedIn, OrderController.atm)
router.get('/credit', authMiddleware.isLoggedIn, OrderController.credit)

module.exports = router;

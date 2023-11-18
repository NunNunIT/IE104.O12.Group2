const express = require('express')
const router = express.Router()

// import controller
const OrderController = require('../controllers/OrderController')

router.get('/cart', OrderController.cart)
router.post('/cart', (req, res) => {
    // res.send(1)
    console.log(req.body)
    // res.redirect('/')
    // res.writeHead(302, { 'Location': '/order/information' })
})

router.get('/information', OrderController.information)
router.get('/transaction', OrderController.transaction)
router.get('/momo', OrderController.momo)
router.get('/atm', OrderController.atm)
router.get('/credit', OrderController.credit)

module.exports = router
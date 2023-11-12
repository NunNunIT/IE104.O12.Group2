const express = require('express')
const router = express.Router();

// import controller
const adminController = require('../controllers/adminController.js')

router.get('/', adminController.getDashboard)
router.get('/dashboard', adminController.getDashboard)
router.get('/categories_admin', adminController.getCategory)
router.get('/orders_admin', adminController.getCategory)

module.exports = router
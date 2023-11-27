const express = require('express')
const router = express.Router();

// import controller
const adminController = require('../controllers/admin/adminController')

// import middleware
const adminMiddleware = require('../middleware/adminMiddleware.js')

router.get('/login', adminMiddleware.checkAuth, adminController.getLogin)
router.post('/login', adminMiddleware.checkAuth, adminController.postLogin)
router.get('/logout', adminMiddleware.checkUnAuth, adminController.getLogout)
router.get('/', adminMiddleware.isLoggedIn, adminController.getDashboard)
router.get('/dashboard', adminMiddleware.isLoggedIn, adminController.getDashboard)
router.get('/categories_admin', adminMiddleware.isLoggedIn, adminController.getCategory)
router.get('/categories_admin/delete/:id', adminMiddleware.isLoggedIn, adminController.deleteCategory)
router.get('/orders_admin', adminMiddleware.isLoggedIn, adminController.getOrders)

module.exports = router
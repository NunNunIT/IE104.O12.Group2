const express = require('express')
const router = express.Router();

// import controller
const authAdminController = require('../controllers/admin/authAdminController.js')
const dashboardAdminController = require('../controllers/admin/dashboardAdminController.js')
const cateAdminController = require('../controllers/admin/cateAdminController.js')

// import middleware
const adminMiddleware = require('../middleware/adminMiddleware.js')

// admin auth
router.get('/login', adminMiddleware.checkAuth, authAdminController.getLogin)
router.post('/login', adminMiddleware.checkAuth, authAdminController.postLogin)
router.get('/logout', adminMiddleware.checkUnAuth, authAdminController.getLogout)

// admin dashboard
router.get('/dashboard', adminMiddleware.isLoggedIn, dashboardAdminController.getDashboard)
router.get('/dashboard/getChart', adminMiddleware.isLoggedIn, dashboardAdminController.getChart)
router.get('/', adminMiddleware.isLoggedIn, dashboardAdminController.getDashboard)

// admin cate management
router.get('/categories_admin/add', adminMiddleware.isLoggedIn, cateAdminController.addCategories)
router.get('/categories_admin', adminMiddleware.isLoggedIn, cateAdminController.getCategories)

// admin product management
router.get('/products_admin/add', adminMiddleware.isLoggedIn, cateAdminController.addProducts)
router.get('/products_admin', adminMiddleware.isLoggedIn, cateAdminController.getProducts)

module.exports = router
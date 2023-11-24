const db = require('../config/db/connect')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const { promisify } = require('util')

class SiteController {
    // [GET] /
    index(req, res) {
        const productCatalog = {
            'cooker': 'Nồi cơm điện',
            'fan': 'Quạt điện',
            'fridge': 'Tủ lạnh',
            'television': 'Ti vi',
            'water-purifier': 'Máy lọc nước',
            'induction-cooker': 'Bếp từ'
        }

        res.render('./pages/site/index', {
            user: (req.user)? req.user : 0,
            productCatalog
        })
    }
    
    indexPost(req, res) {
        const productCatalog = {
            'cooker': 'Nồi cơm điện',
            'fan': 'Quạt điện',
            'fridge': 'Tủ lạnh',
            'television': 'Ti vi',
            'water-purifier': 'Máy lọc nước',
            'induction-cooker': 'Bếp từ'
        }

        res.render('./pages/site/index', {
            user: (req.user)? req.user : 0,
            productCatalog
        })
    }


    //[GET] /about-us
    aboutUs(req, res) {
        res.render('./pages/site/about-us', {
            user: (req.user)? req.user : 0
        })
    }

    //[GET] /privacy-policy
    privacyPolicy(req, res) {
        res.render('./pages/site/privacy-policy', {
            user: (req.user)? req.user : 0
        })
    }

    error(req, res) {
        res.render('./pages/site/404-error', {
            user: (req.user)? req.user : 0
        })
    }
}

module.exports = new SiteController()
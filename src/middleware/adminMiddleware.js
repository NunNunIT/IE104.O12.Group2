const db = require('../config/db/connect');
const jwt = require('jsonwebtoken')
const { promisify } = require('util')

exports.isLoggedIn = async (req, res, next) => {
    console.log(`isLoggedIn: ${req.cookies.adminSave}`);
    if (req.cookies.adminSave) {
        try {
            // 1. Verify the token
            const decoded = await promisify(jwt.verify)(req.cookies.adminSave,
                process.env.JWT_SECRET
            );
            console.log(decoded);

            // 2. Check if the admin still exist
            db.query('SELECT * FROM admin WHERE admin_id = ?', [decoded.id], (err, results) => {
                if (!results) {
                    return next();
                }
                req.admin = results[0];
                next();
            });
        } catch (err) {
            console.log(err)
            return next();
        }
    } else {
        res.status(401).redirect('/admin/login')
    }
}

exports.checkAuth = (req, res, next) => {
    console.log(`checkAuth: ${req.cookies.adminSave}`)
    if (req.cookies.adminSave) {
        res.redirect('/admin/')
    }
    else {
        next();
    }
}

exports.checkUnAuth = (req, res, next) => {
    console.log(`checkUnAuth: ${req.cookies.adminSave}`)
    if (!req.cookies.adminSave) {
        res.status(401).redirect('/admin/')
    }
    else {
        next();
    }
}

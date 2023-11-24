const db = require('../config/db/connect');
const jwt = require('jsonwebtoken')
const {promisify} = require('util')

exports.isLoggedIn = async (req, res, next) => {
    console.log(`isLoggedIn: ${req.cookies.userSave}`);
    if (req.cookies.userSave) {
        try {
            // 1. Verify the token
            const decoded = await promisify(jwt.verify)(req.cookies.userSave,
                process.env.JWT_SECRET
            );
            console.log(decoded);

            // 2. Check if the user still exist
            db.query('SELECT * FROM users WHERE user_id = ?', [decoded.id], (err, results) => {
                console.log(results);
                if (!results) {
                    return next();
                }
                req.user = results[0];
                next();
            });
        } catch (err) {
            console.log(err)
            return next();
        }
    } else {
        res.status(401).redirect('/auth/login')
    }
}

exports.checkAuth = (req, res, next) => {
    console.log (`checkAuth: ${req.cookies.userSave}`)
    if (req.cookies.userSave) {
        res.redirect('/')
    }
    else {
        next();
    }
}

exports.checkUnAuth = (req, res, next) => {
    console.log (`checkUnAuth: ${req.cookies.userSave}`)
    if (!req.cookies.userSave) {
        res.status(401).redirect('/')
    }
    else {
        next();
    }
}

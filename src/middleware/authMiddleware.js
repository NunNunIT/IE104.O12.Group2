const db = require('../config/db/connect');
const jwt = require('jsonwebtoken')
const general = require('../models/general.model')
const { promisify } = require('util')

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
            db.query('SELECT * FROM view_user WHERE user_id = ?', [decoded.id], (err, results) => {
                if (!results) {
                    return next();
                }

                req.user = results[0];
                next();
            });
        } catch (err) {
            console.log(err)
            next()
        }
    } else {
        res.status(401).redirect('/auth/login')
    }
}

exports.checkAuth = (req, res, next) => {
    console.log(`checkAuth: ${req.cookies.userSave}`)
    if (req.cookies.userSave) {
        res.redirect('/')
    }
    else {
        return next();
    }
}

exports.checkUnAuth = (req, res, next) => {
    console.log(`checkUnAuth: ${req.cookies.userSave}`)
    if (!req.cookies.userSave) {
        res.status(401).redirect('/')
    }
    else {
        return next();
    }
}

exports.getLoggedIn = async (req, res, next) => {
    console.log(`getLoggedIn: ${req.cookies.userSave}`);
    if (req.cookies.userSave) {
        try {
            // 1. Verify the token
            const decoded = await promisify(jwt.verify)(req.cookies.userSave,
                process.env.JWT_SECRET
            );
            console.log(decoded);

            // 2. Check if the user still exist
            db.query('SELECT * FROM view_user WHERE user_id = ?', [decoded.id], (err, results) => {
                if (!results) {
                    return next();
                }

                results.forEach((result) => {
                    result.user_birth_format = general.toDDMMYYYY(new Date(result.user_birth))
                })

                req.user = results[0];
                next();
            });
        } catch (err) {
            console.log(err)
            next();
        }
    } else {
        next();
    }
}
const db = require('../config/db/connect');
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

const db = require('../config/db/connect');
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const { promisify } = require("util");

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

        res.render('./pages/index', { productCatalog })
    }

    // [GET] /register
    register(req, res) {
        res.render('./pages/register')
    }

    // [POST] /register
    submitRegister(req, res) {
        const {
            user_login_name,
            user_phone,
            user_password: NewPassword
        } = req.body

        db.query('SELECT user_phone FROM users WHERE user_phone = ?', [user_phone], async (err, result) => {
            if (err) throw err;
            if (result[0]) return res.json({
                status: "error",
                error: "Số điện thoại đã được sử dụng"
            })
            else {
                const user_password = bcrypt.hash(NewPassword, 8)
                db.query('INSERT INTO users SET ?', {
                    user_login_name: user_login_name,
                    user_phone: user_phone,
                    user_password: user_password
                }, async (error, results) => {
                    if (error) throw error;
                    return res.json({
                        status: "success",
                        success: "Register successfully"
                    })
                    //res.redirect('/');
                })
            }
        })
    }

    // [GET] /login
    login(req, res) {
        res.render('./pages/login')
    }

    // [POST] /login
    submitLogin(req, res) {
        const { user_phone, user_password } = req.body;
        db.query('SELECT *  FROM users WHERE user_phone = ?', [user_phone], async (err, result) => {
            console.log(result);
            if (err) throw err;
            // if (!result.length || !await bcrypt.compare(user_password, result[0].user_password)) return res.json({
            if (!result[0]) return res.json({
                status: "error",
                error: "Số điện thoại không tồn tại."
            })
            else if ((user_password !== result[0].user_password)) return res.json({
                status: "error2",
                error: "Mật khẩu không chính xác."
            })
        })
    }

    search(req, res) {
        const searchResults = {
            'name': 'HaiYen',
            'rate': '4'
        }
        res.render('./pages/search-results', { searchResults })
    }

    //[GET] /account
    account(req, res) {
        res.render('./pages/account')
    }
}

module.exports = new SiteController()
const db = require('../config/db/connect');
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

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

    productDetail(req, res) {
        const title = 'Chi tiết sản phẩm'
        res.render('./pages/product-detail', { title })
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


}


module.exports = new SiteController()
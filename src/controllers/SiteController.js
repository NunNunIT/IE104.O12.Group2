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



}

module.exports = new SiteController()
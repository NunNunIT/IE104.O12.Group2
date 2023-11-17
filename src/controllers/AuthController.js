const db = require('../config/db/connect');
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
class AuthController {

    // [GET] auth/register
    register(req, res) {
        res.render('./pages/auth/register')
    }

    // [POST] auth/register
    submitRegister(req, res) {
        const {
            user_login_name,
            user_phone,
            user_password
        } = req.body

        db.query('SELECT user_phone FROM users WHERE user_phone = ?', [user_phone], async (err, result) => {
            if (err) throw err
            if (result[0]) return res.json({
                status: 'error',
                error: 'Số điện thoại đã được sử dụng'
            })
            else {
                let hashedPassword = await bcrypt.hash( user_password, 8);
                console.log(hashedPassword);

                db.query('INSERT INTO users SET ?', {
                    user_login_name: user_phone,
                    user_phone: user_phone,
                    user_name: user_login_name,
                    user_password: hashedPassword,
                    user_register_date: new Date(),
                    user_active: 1
                }, async (error, results) => {
                    if (error) throw error
                    return res.json({
                        status: 'success',
                        success: 'Register successfully'
                    })
                    //res.redirect('/')
                })
            }
        })
    }

    // [GET] /login
    login(req, res) {
        res.render('./pages/auth/login')
    }

    // [POST] /login
    submitLogin(req, res) {
        const { user_phone, user_password } = req.body
        db.query('SELECT *  FROM users WHERE user_phone = ?', [user_phone], async (err, result) => {
            console.log(result)
            if (err) throw err
            // if (!result.length || !await bcrypt.compare(user_password, result[0].user_password)) return res.json({
            if (!result[0]) return res.json({
                status: 'error',
                error: 'Số điện thoại không tồn tại.'
            })
            else if ((user_password !== result[0].user_password)) return res.json({
                status: 'error2',
                error: 'Mật khẩu không chính xác.'
            })
        })
    }

    forgotPassword(req, res) {
        const title = 'Quên mật khẩu'
        res.render('./pages/auth/forgot', { title })
    }

    resetPassword(req, res) {
        const title = 'Đặt lại mật khẩu'
        res.render('./pages/auth/reset', { title })
    }

}

module.exports = new AuthController()
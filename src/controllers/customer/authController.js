const { json } = require('express')
const db = require('../../config/db/connect')
const auth = require('../../models/customer/auth.model')
const jwt = require('jsonwebtoken')
const { promisify } = require('util')

const index = require('../../models/customer/index.model')

const authController = () => { }

// [GET] auth/register
authController.register = async (req, res) => {
    res.render('./pages/auth/register')
}

// [POST] auth/register
authController.submitRegister = async (req, res) => {
    auth.registerPost(req, function (error, dupPhoneNumber, success) {
        if (error) res.render('./pages/site/404-error')
        if (dupPhoneNumber)
            return res.json({
                status: 'error',
                error: 'Số điện thoại đã được sử dụng',
            })

        if (success)
            return res.json({
                status: 'success',
                success: 'Register successfully',
            })
    })
}

// [GET] /login
authController.login = async (req, res) => {
    res.render('./pages/auth/login')
}

// [POST] /login
authController.submitLogin = async (req, res) => {
    auth.loginPost(req, function (err, nonePhoneNumber, NotMatchPassword, success, id) {
        if (err) res.render('./pages/site/404-error')
        if (nonePhoneNumber) {
            return res.json({
                status: 'error',
                error: 'Số điện thoại không tồn tại.',
            })
        }

        if (NotMatchPassword) {
            return res.json({
                status: 'error2',
                error: 'Mật khẩu không chính xác.',
            })
        }

        if (success) {
            const token = jwt.sign({
                id,
            },
                process.env.JWT_SECRET, {
                expiresIn: process.env.JWT_EXPIRES,
            }
            )

            const cookieOptions = {
                expires: new Date(
                    Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 60 * 1000
                ),
                httpOnly: true,
            }
            res.cookie('userSave', token, cookieOptions)
            res.json({
                status: 'success',
                success: 'Bạn đã đăng nhập thành công',
            })
        }
    })
}

authController.logout = async (req, res) => {
    res.cookie('userSave', 'logout', {
        expires: new Date(Date.now() + 2 * 1000),
        httpOnly: true,
    })
    res.status(200).redirect('/')
}

authController.forgotPassword = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    const title = 'Quên mật khẩu'
    res.render('./pages/auth/forgot', {
        header: header,
        user: header_user,
        title,
    })
}

authController.findUser = async (req, res) => {
    auth.findNumberPhone(req, function (err, notFound, success, user_id) {
        if (err) {
            return res.json({
                status: 'error',
                error: 'Lỗi truy cập.',
            })
        } else if (notFound) {
            return res.json({
                status: 'notFound',
                error: 'Số điện thoại không tồn tại.',
            })
        } else if (success) {
            return res.json({
                status: 'success',
                error: 'Thành công.',
                user_id: user_id
            })
        }

    })
}

authController.forgotPasswordPost = async (req, res) => {
    auth.findNumberPhone(req, function (err, notFound, success, user_id) {
        if (err) {
            return res.json({
                status: 'error',
                error: 'Lỗi truy cập.',
            })
        } else if (notFound) {
            return res.json({
                status: 'notFound',
                error: 'Số điện thoại không tồn tại.',
            })
        } else if (success) {
            return res.json({
                status: 'success',
                error: 'Thành công.',
                user_id: user_id,
            })
        }
    })
}

authController.resetPassword = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    const title = 'Đặt lại mật khẩu'

    res.render('./pages/auth/reset', {
        header: header,
        user: header_user,
        title,
    })
}

module.exports = authController
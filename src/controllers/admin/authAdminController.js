const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)

const authAdmin = require('../../models/admin/authAdmin.model')
class adminController {
    // [GET] admin/login
    getLogin(req, res) {
        res.status(200).render('admin/pages/login_admin')
    }

    // [POST] admin/login
    postLogin(req, res) {
        authAdmin.loginPost(req, function (err, noneAdmin, NotMatchPassword, success, id) {
            if (err) res.render('./pages/site/404-error')
            if (noneAdmin) {
                return res.json({
                    status: 'error',
                    error: 'Tên đăng nhập không tồn tại.'
                })
            }

            if (NotMatchPassword) {
                return res.json({
                    status: 'error2',
                    error: 'Mật khẩu không chính xác.'
                })
            }

            if (success) {
                const token = jwt.sign({
                    id
                }, process.env.JWT_SECRET, {
                    expiresIn: process.env.JWT_EXPIRES
                });

                console.log("the token is " + token);

                const cookieOptions = {
                    expires: new Date(
                        Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 1000
                    ),
                    httpOnly: true
                }
                res.cookie('adminSave', token, cookieOptions)
                res.json({
                    status: 'success',
                    success: 'Bạn đã đăng nhập thành công'
                })
            }
        })
    }

    getLogout = (req, res) => {
        console.log('Admin logout')
        res.cookie('adminSave', 'logout', {
            expires: new Date(Date.now() + 2 * 1000),
            httpOnly: true
        });
        res.status(200).render("./admin/pages/login_admin");
    }

}

module.exports = new adminController()
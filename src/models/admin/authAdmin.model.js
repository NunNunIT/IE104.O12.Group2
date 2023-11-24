const db = require('../../config/db/connect')
const bcrypt = require('bcryptjs')


const authAdmin = function () {}

authAdmin.loginPost = async (req, callback) => {
    console.log('Đăng nhập:', req.body)
    const admin_login_name = req.body.adminLogin;
    const admin_password = req.body.password;
    console.log('gán req.body:', admin_login_name, admin_password)

    db.query('SELECT * FROM admin WHERE admin_login_name = ?', [admin_login_name], async (err, result) => {
        console.log(result)
        if (err) callback(1, 0, 0, 0, 0)
        if (!result.length) callback(0, 1, 0, 0, 0)
        else if (!await bcrypt.compare(admin_password, result[0].admin_password)) {
            callback(0, 0, 1, 0, 0)
        } else {
            const id = result[0].admin_id;
            callback(0, 0, 0, 1, id)
        }
    })
}

module.exports = authAdmin
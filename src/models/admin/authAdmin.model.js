const db = require('../../config/db/connect')
const bcrypt = require('bcryptjs')


const authAdmin = function () { }

authAdmin.loginPost = async (req, callback) => {
    const admin_login_name = req.body.adminLogin;
    const admin_password = req.body.password;

    db.query('SELECT * FROM admin WHERE admin_login_name = ?', [admin_login_name], async (err, result) => {
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
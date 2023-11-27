const db = require('../../config/db/connect')
const bcrypt = require('bcryptjs')


const account = function () {}

account.checkPassword = async (req, callback) => {
    // console.log('Đăng nhập:', req.body)
    const user_password = req.body.user_password;
    const user_id = req.user.user_id;
    console.log(user_password)

    // console.log('gán req.body:', user_phone, user_password)

    db.query('SELECT *  FROM users WHERE user_id = ?', [user_id], async (err, result) => {
        // console.log(result)
        if (err) callback(1, 0, 0)
        if (!await bcrypt.compare(user_password, result[0].user_password)) {
            callback(0, 1, 0)
        } else {
            callback(0, 0, 1)
        }
    })
}

module.exports = account
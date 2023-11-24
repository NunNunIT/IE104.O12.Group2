const db = require('../../config/db/connect')
const bcrypt = require('bcryptjs')


const auth = function () {}

auth.registerPost = async (req, callback) => {
    // console.log('Đăng ký:', req.body)
    const {
        user_login_name,
        user_phone,
        user_password
    } = req.body

    db.query('SELECT user_phone FROM users WHERE user_phone = ?', [user_phone], async (err, result) => {
        if (err) callback(1, 0, 0)
        if (result[0]) {
            callback(0, 1, 0)
        } else {
            let hashedPassword = await bcrypt.hash(user_password, 8);
            // console.log(hashedPassword);

            db.query('INSERT INTO users SET ?', {
                user_login_name: user_phone,
                user_phone: user_phone,
                user_name: user_login_name,
                user_password: hashedPassword,
                user_register_date: new Date(),
                user_active: 1
            }, async (error, results) => {
                if (err) callback(1, 0, 0)
                callback(0, 0, 1)
            })
        }
    })
}

auth.loginPost = async (req, callback) => {
    // console.log('Đăng nhập:', req.body)
    const user_phone = req.body.phoneNumber;
    const user_password = req.body.password;
    // console.log('gán req.body:', user_phone, user_password)

    db.query('SELECT *  FROM users WHERE user_phone = ?', [user_phone], async (err, result) => {
        // console.log(result)
        if (err) callback(1, 0, 0, 0, 0)
        if (!result.length) callback(0, 1, 0, 0, 0)
        else if (!await bcrypt.compare(user_password, result[0].user_password)) {
            callback(0, 0, 1, 0, 0)
        } else {
            const id = result[0].user_id;
            callback(0, 0, 0, 1, id)
        }
    })
}

module.exports = auth
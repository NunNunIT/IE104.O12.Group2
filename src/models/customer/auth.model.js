const db = require('../../config/db/connect')
const bcrypt = require('bcryptjs')


const auth = function () { }

auth.registerPost = async (req, callback) => {
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

            db.query('INSERT INTO users SET ?', [{
                user_login_name: user_phone,
                user_phone: user_phone,
                user_name: user_login_name,
                user_password: hashedPassword,
                user_register_date: new Date(),
                user_active: 1
            }], async (error, results) => {
                if (err) callback(1, 0, 0)
                callback(0, 0, 1)
            })
        }
    })
}

auth.loginPost = async (req, callback) => {
    const user_phone = req.body.phoneNumber;
    const user_password = req.body.password;

    db.query('SELECT *  FROM users WHERE user_phone = ?', [user_phone], async (err, result) => {
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

auth.findNumberPhone = async (req, callback) => {
    const user_phone = req.body.user_phone;

    db.query('SELECT *  FROM users WHERE user_phone = ?', [user_phone], async (err, result) => {
        if (err) callback(1, 0, 0, 0)
        if (!result.length) callback(0, 1, 0, 0)
        else {
            const id = result[0].user_id;
            callback(0, 0, 1, id)
        }
    })
}

auth.checkPhone = (phone, callback) => {
    const sql = `
        SELECT *
        FROM USERS
        WHERE user_phone = ?`
    db.query(sql, [phone], (err, result) => {
        callback(err, result)
    })
}

auth.checkOldPassword = async ( user_old_password, user_password , callback) => {
    console.log(user_old_password, user_password)
    if (!await bcrypt.compare(user_old_password, user_password)){
        callback(1, 0)
    } else {
        callback(0, 1)
    }
}

auth.resetPassword = async (phone, password, callback) => {
    const hashedPass = await bcrypt.hash(password, 8)
    const sql = `
        UPDATE USERS
        SET user_password = '${hashedPass}'
        WHERE user_phone = '${phone}';`;
    db.query(sql, (err, result) => {
        callback(err, result)
    })
}

module.exports = auth
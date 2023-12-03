const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../general.model');
const index = require('./index.model')


const account = function () {}


account.updateInfo = async (req, res) => {
    let updateInfo = `UPDATE users 
                      SET user_login_name = ${req.body.user_phone},
                      user_name = '${req.body.user_name}',
                      user_birth = DATE(${req.body.user_birth}),
                      user_email = '${req.body.user_email}', 
                      user_phone = '${req.body.user_phone}',
                      user_address ='${req.body.user_address}'
                      WHERE user_id = ${req.user.user_id}`
    let result = await query(updateInfo)
    console.log(result)
}

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

account.getPurchaseHistory = async (customer_id, order_status, order_id) => {
    let getPurchaseHistorys = `SELECT * 
                                FROM orders LEFT JOIN paying_methods ON orders.payment_method_id = paying_methods.payment_method_id
                                WHERE customer_id = ${customer_id}`

    if (order_id) {
        getPurchaseHistorys += ` AND order_id = ${order_id}`
    } 
    if (order_status) {
        getPurchaseHistorys += ` AND order_status = '${order_status}'`
    }

    getPurchaseHistorys += ` ORDER BY order_date DESC`

    let purchaseHistorys = await query(getPurchaseHistorys)

    return new Promise(async (resolve, reject) => {
        const promises = [];
        purchaseHistorys.forEach(async(purchaseHistory) => {
        promises.push(
            account.getDetailPurchaseHistorys(purchaseHistory.order_id).then((order_details) => {
                purchaseHistory.order_details = order_details
            })
        );
        })
        await Promise.all(promises);
        resolve(purchaseHistorys);
    })
}

account.getDetailPurchaseHistorys = async (order_id) => {
    let getDetailPurchaseHistorys = `SELECT * FROM view_order_detail WHERE order_id = ${order_id}` 
    let detailPurchaseHistorys = await query(getDetailPurchaseHistorys)

    return new Promise(async (resolve, reject) => {
        resolve(detailPurchaseHistorys);
    })
}

module.exports = account
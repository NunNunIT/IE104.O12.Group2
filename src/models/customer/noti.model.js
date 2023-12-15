const general = require('../../models/general.model')
const index = require('../../models/customer/index.model')
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)


const notifications = function () { }

// [POST] /notification/account-update
// [POST] /notification/promotion
notifications.readNotification = ({ id, noti_id }, callback) => {
    const readNotification = `
        UPDATE usernoti
        SET usernoti_is_read = 1
        WHERE au_user_id = ${id}
            AND noti_id = ${noti_id}
    `

    db.query(readNotification, (err, result) => {
        callback(err, result);
    })
}

// [GET] /notification/read-all
notifications.readAllNotifications = ({ id, noti_type }, callback) => {
    const readAllNotification = `
    UPDATE usernoti
    SET usernoti_is_read = 1
    WHERE usernoti.au_user_id = ${id}
      AND usernoti.noti_id in (SELECT notification_id FROM notifications WHERE notification_types_id = ${noti_type});
    `

    db.query(readAllNotification, (err, result) => {
        callback(err, result);
    })
}

module.exports = notifications
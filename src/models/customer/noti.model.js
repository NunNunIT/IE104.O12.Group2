const general = require('../../models/general.model')
const index = require('../../models/customer/index.model')
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)


const notifications = function () { }

// [GET] /notification/order
notifications.getOrder = async (user_id, callback) => {
    const getAccountUpdate = `
        SELECT * FROM view_notifications 
        WHERE user_id = ${user_id}
        AND NOT(notification_type_id = 6)
        AND NOT(notification_type_id = 7)
        `
    return new Promise((resolve, reject) => {
        db.query(getAccountUpdate, (err, accountUpdates)  => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(accountUpdates)
            }
        })
    })
}

// [GET] /notification/promotion
notifications.getPromotion = async (user_id, callback) => {
    const getPromotion = `
        SELECT * FROM view_notifications 
        WHERE user_id = ${user_id}
        AND notification_type_id = 6
        OR notification_type_id = 7
        `
    return new Promise((resolve, reject) => {
        db.query(getPromotion, (err, promotions)  => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(promotions)
            }
        })
    })
}


// [POST] /notification/order
// [POST] /notification/promotion
notifications.readNotification = ({ id, noti_id }, callback) => {
    const readNotification = `
        UPDATE user_notification
        SET user_notification_is_read = 1
        WHERE user_id = ${id}
            AND notification_id = ${noti_id}
    `

    db.query(readNotification, (err, result) => {
        callback(err, result);
    })
}

// [GET] /notification/read-all
notifications.readAllNotifications = ({ id, noti_type }, callback) => {
    let readAllNotification = `
    UPDATE user_notification
    SET user_notification_is_read = 1
    WHERE user_notification.user_id = ${id}
      AND user_notification.notification_id in (SELECT notification_id FROM notifications WHERE
    `
    if (noti_type == 1) {
        readAllNotification += ` NOT(notification_type_id = 6)
                                AND NOT(notification_type_id = 7));`
    } else if (noti_type == 2) {
        readAllNotification += ` (notification_type_id = 6)
                                OR (notification_type_id = 7));`
    }

    db.query(readAllNotification, (err, result) => {
        callback(err, result);
    })
}

module.exports = notifications
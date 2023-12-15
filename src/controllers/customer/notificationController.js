const index = require('../../models/customer/index.model')
const general = require('../../models/general.model')
const notifications = require('../../models/customer/noti.model')

const notificationsController = () => { }

// [GET] /notification/account-update
notificationsController.accountUpdate = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.render('./pages/notification/account-update', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

// [GET] /notification/promotion
notificationsController.promotion = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.render('./pages/notification/promotion', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

// [POST] /notifications/account-update
// [POST] /notifications/promotion
notificationsController.readNotification = async (req, res) => {
    const { noti_id } = req.body;

    notifications.readNotification({
        "id": req.user.user_id,
        "noti_id": noti_id
    }, (err, result) => {
        if (err) throw err;
    })
}


// [POST] /notifications/read-all
notificationsController.readAllNotifications = async (req, res) => {
    notifications.readAllNotifications({
        "id": req.user.user_id,
        "noti_type": req.body.noti_type
    }, (err, result) => {
        if (err) throw err;
    })

}

module.exports = notificationsController

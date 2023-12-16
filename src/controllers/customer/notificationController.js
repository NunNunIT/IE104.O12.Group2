const index = require('../../models/customer/index.model')
const general = require('../../models/general.model')
const notifications = require('../../models/customer/noti.model')

const notificationsController = () => { }

// [GET] /notification/account-update
notificationsController.order = async (req, res) => {
    let user_id = req.user.user_id

    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    let orders = await notifications.getOrder(user_id)

    res.render('./pages/notification/order', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
        order: orders,
    })
}

// [GET] /notification/promotion
notificationsController.promotion = async (req, res) => {
    let user_id = req.user.user_id

    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    let promotions = await notifications.getPromotion(user_id)

    res.render('./pages/notification/promotion', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
        promotions: promotions,
    })
}

// [POST] /notifications/order
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
    await notifications.readAllNotifications({
        "id": req.user.user_id,
        "noti_type": req.body.noti_type
    }, (err, result) => {
        if (err) throw err;
    })

}

module.exports = notificationsController


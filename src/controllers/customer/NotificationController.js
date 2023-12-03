const index = require('../../models/customer/index.model')
const general = require('../../models/general.model')

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

module.exports = notificationsController
const index = require('../../models/customer/index.model')

const notificationsController = () => { }

// [GET] /notification/account-update
notificationsController.accountUpdate = async (req, res) => {
    res.render('./pages/notification/account-update', {
        user: (req.user) ? req.user : 0
    })
}

// [GET] /notification/promotion
notificationsController.promotion = async (req, res) => {
    res.render('./pages/notification/promotion', {
        user: (req.user) ? req.user : 0
    })
}

module.exports = notificationsController
class NotificationsController {

    // [GET] /notification/account-update
    accountUpdate(req, res) {
        res.render('./pages/notification/account-update')
    }

    // [GET] /notification/promotion
    promotion(req, res) {
        res.render('./pages/notification/promotion')
    }

}

module.exports = new NotificationsController()
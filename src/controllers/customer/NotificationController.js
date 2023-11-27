class NotificationsController {

    // [GET] /notification/account-update
    accountUpdate(req, res) {
        res.render('./pages/notification/account-update', {
            user: (req.user)? req.user : 0
        })
    }

    // [GET] /notification/promotion
    promotion(req, res) {
        res.render('./pages/notification/promotion', {
            user: (req.user)? req.user : 0
        })
    }

}

module.exports = new NotificationsController()
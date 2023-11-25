class AccountController {

    // [GET] /account/information
    information(req, res) {
        res.render('./pages/account/information', {
            user: (req.user)? req.user : 0
        })
    }

    // [GET] /account/pruchase-history
    purchaseHistory(req, res) {
        res.render('./pages/account/purchase-history', {
            user: (req.user)? req.user : 0
        })
    }

    // [GET] /account/pruchase-history
    purchaseDetail(req, res) {
        res.render('./pages/account/purchase-detail', {
            user: (req.user)? req.user : 0
        })
    }

    // [GET] /account/feedback
    feedback(req, res) {
        res.render('./pages/account/feedback', {
            user: (req.user)? req.user : 0
        })
    }

    warrantyClaim(req, res) {
        res.render('./pages/account/warranty-claim', {
            user: (req.user)? req.user : 0
        })
    }

    //GET /account/edit-information
    editInformation(req, res) {
        res.render("./pages/account/edit-information", {
            user: (req.user)? req.user : 0
        })
    }
    //GET /account/sidebar_account
    mobileAccount(req, res) {
        res.render("./pages/account/mobile-account", {
            user: (req.user)? req.user : 0
        })
    }
}

module.exports = new AccountController()
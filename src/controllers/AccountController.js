class AccountController {

    // [GET] /account/information
    information(rea, res) {
        res.render('./pages/account/information')
    }

    // [GET] /account/pruchase-history
    purchaseHistory(req, res) {
        res.render('./pages/account/purchase-history')
    }

    // [GET] /account/pruchase-history
    purchaseDetail(req, res) {
        res.render('./pages/account/purchase-detail')
    }

    // [GET] /account/feedback
    feedback(req, res) {
        res.render('./pages/account/feedback')
    }

    warrantyClaim(req, res) {
        res.render('./pages/account/warranty-claim')
    }

    //GET /account/edit-information
    editInformation(req, res) {
        res.render("./pages/account/edit-information")
    }
    //GET /account/sidebar_account
    mobileAccount(req, res) {
        res.render("./pages/account/mobile-account")
    }
}

module.exports = new AccountController()
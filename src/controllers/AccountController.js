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

    warrantyClaim(req, res) {
        res.render('./pages/account/warranty-claim')
    }

}

module.exports = new AccountController()
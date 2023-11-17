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

}

module.exports = new AccountController()
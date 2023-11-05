class AccountController {
    purchase(req, res) {
        res.render('./pages/account/purchase.ejs')
    }

    purchaseDetail(req, res) {
        res.render('./pages/account/purchase-detail.ejs')
    }

}

module.exports = new AccountController()
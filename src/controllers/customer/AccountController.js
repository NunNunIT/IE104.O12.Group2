const index = require('../../models/customer/index.model')

const accountController = () => { }

// [GET] /account/information
accountController.information = async (req, res) => {
    res.render('./pages/account/information', {
        user: (req.user) ? req.user : 0
    })
}

// [GET] /account/pruchase-history
accountController.purchaseHistory = async (req, res) => {
    res.render('./pages/account/purchase-history', {
        user: (req.user) ? req.user : 0
    })
}

// [GET] /account/pruchase-history
accountController.purchaseDetail = async (req, res) => {
    res.render('./pages/account/purchase-detail', {
        user: (req.user) ? req.user : 0
    })
}

// [GET] /account/feedback
accountController.feedback = async (req, res) => {
    res.render('./pages/account/feedback', {
        user: (req.user) ? req.user : 0
    })
}

accountController.warrantyClaim = async (req, res) => {
    res.render('./pages/account/warranty-claim', {
        user: (req.user) ? req.user : 0
    })
}

accountController.changePassword = async (req, res) => {
    res.render('./pages/account/changePassword')
}

//GET /account/edit-information
accountController.editInformation = async (req, res) => {
    res.render("./pages/account/edit-information", {
        user: (req.user) ? req.user : 0
    })
}
//GET /account/sidebar_account
accountController.mobileAccount = async (req, res) => {
    res.render("./pages/account/mobile-account", {
        user: (req.user) ? req.user : 0
    })
}

module.exports = accountController
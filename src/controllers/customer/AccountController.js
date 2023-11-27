const index = require('../../models/customer/index.model')

const accountController = () => { }

// [GET] /account/information
accountController.information = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/account/information', {
        user: (req.user) ? req.user : 0
    })
}

// [GET] /account/pruchase-history
accountController.purchaseHistory = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/account/purchase-history', {
        user: (req.user) ? req.user : 0
    })
}

// [GET] /account/pruchase-history
accountController.purchaseDetail = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/account/purchase-detail', {
        user: (req.user) ? req.user : 0
    })
}

// [GET] /account/feedback
accountController.feedback = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/account/feedback', {
        header: header,
        user: header_user,
    })
}

accountController.checkUser = async (req, res) => {
    auth.checkPassword(req, function (err, wrong, success) {
        if (err) {
            return res.json({
                status: 'error',
                error: 'Lỗi truy cập.',
            })
        } else if (wrong) {
            return res.json({
                status: 'wrongPassword',
                error: 'Mật khẩu không chính xác!',
            })
        } else if (success) {
            return res.json({
                status: 'success',
                error: 'Thành công.',
            })
        }
    })
}

accountController.warrantyClaim = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/account/warranty-claim', {
        header: header,
        user: header_user,
    })
}

accountController.changePassword = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/account/changePassword', {
        header: header,
        user: header_user,
    })
}

//GET /account/edit-information
accountController.editInformation = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/account/edit-information', {
        header: header,
        user: header_user,
    })
}

//GET /account/sidebar_account
accountController.mobileAccount = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/account/mobile-account', {
        header: header,
        user: header_user,
    })
}

module.exports = accountController
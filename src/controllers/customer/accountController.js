const account = require('../../models/customer/account.model')
const index = require('../../models/customer/index.model')
const general = require('../../models/general.model')

const accountController = () => { }

// [GET] /account/information
accountController.information = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.render('./pages/account/information', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

//GET /account/edit-information
accountController.getEditInformation = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.render('./pages/account/edit-information', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

//POST /account/edit-information
accountController.editInformation = async (req, res) => {
    // await account.updateInfo(req)

    // res.redirect('./information')
    try {
        await account.updateInfo(req);
        // Nếu không có lỗi, chuyển hướng về trang information
        res.redirect('./information');
    } catch (error) {
        // Xử lý lỗi nếu cần
        console.error('Update failed:', error);
        // Gửi mã lỗi hoặc thông báo lỗi cho người dùng nếu cần
        res.status(500).send('Internal Server Error');
    }
}


// [GET] /account/pruchase-history
accountController.purchaseHistory = async (req, res) => {
    let customer_id = req.user.customer_id
    let order_status = req.query.order_status ?? 0
    let order_id = req.params.order_id ?? 0

    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    let purchaseHistory = await account.getPurchaseHistory(customer_id, order_status, order_id)

    res.render('./pages/account/purchase-history', {
        header: header,
        user: header_user,
        purchaseHistory: purchaseHistory,
        formatFunction: formatFunction,
    })
}

// [GET] /account/pruchase-history/detail
accountController.purchaseDetail = async (req, res) => {
    let customer_id = req.user.customer_id
    let order_status = req.body.order_status ?? 0
    let order_id = req.params.order_id ?? 0

    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    let purchaseHistory = await account.getPurchaseHistory(customer_id, order_status, order_id)

    res.render('./pages/account/purchase-detail', {
        header: header,
        user: header_user,
        purchaseHistory: purchaseHistory[0],
        formatFunction: formatFunction,
    })
}

// [GET] /account/feedback
accountController.feedback = async (req, res) => {
    let order_id = req.query.order_id
    let customer_id = req.user.customer_id

    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()
    let orderDetails = await account.getDetailPurchaseHistorys(order_id, customer_id)

    res.render('./pages/account/feedback', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
        orderDetails: orderDetails,
    })
}

// [POST] /account/feedback
accountController.sendFeedback = async (req, res) => {
    let customer_id = req.user.customer_id
    let order_id = req.body.order_id
    let feedbacks = req.body.feedbacks
    let error = false

    feedbacks.forEach(feedback => {
        account.insertFeedback(feedback.product_variant_id, customer_id, order_id, feedback.feedback_rate, feedback.feedback_content, function (err, success) {
            if (err) {
                error = true
            }
        })
    })

    if (error) {
        res.status(404).json({
            status: 'error',
        })
    } else {
        res.status(200).json({
            status: 'success',
        })
    }
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

// [GET] /account/warranty-claim
accountController.warrantyClaim = async (req, res) => {
    let customer_id = req.user.customer_id
    let order_status = req.query.order_status ?? 0
    let order_id = req.params.order_id ?? 0

    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    let purchaseHistory = await account.getPurchaseHistory(customer_id, order_status, order_id)

    res.render('./pages/account/warranty-claim', {
        header: header,
        user: header_user,
        purchaseHistory: purchaseHistory,
        formatFunction: formatFunction,
    })
}

//GET /account/changePassword
accountController.changePassword = async (req, res) => {
    let customer_id = req.user.customer_id

    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.render('./pages/account/changePassword', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

//GET /account/sidebar_account
accountController.mobileAccount = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.render('./pages/account/mobile-account', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

module.exports = accountController
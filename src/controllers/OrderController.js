class OrderController {

    // [GET] /order/cart
    cart(req, res) {
        res.render('./pages/order/cart')
    }

    // [GET] /order/information
    information(req, res) {
        res.render('./pages/order/information')
    }

    // [GET] /order/transaction
    transaction(req, res) {
        const title = 'Thanh toán';
        res.render('./pages/order/transaction')
    }

    // [GET] /order/atm
    atm(req, res) {
        const title = 'Thanh toán ATM';
        res.render('./pages/order/atm')
    }

    // [GET] /order/momo
    momo(req, res) {
        const title = 'Thanh toán MoMo';
        res.render('./pages/order/momo')
    }

    // [GET] /order/credit
    credit(req, res) {
        const title = 'Thanh toán Tín dụng';
        res.render('./pages/order/credit')
    }

}

module.exports = new OrderController()
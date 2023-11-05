class SiteController {
    // [GET] /
    index(req, res) {
        const productCatalog = {
            'cooker': 'Nồi cơm điện',
            'fan': 'Quạt điện',
            'fridge': 'Tủ lạnh',
            'television': 'Ti vi',
            'water-purifier': 'Máy lọc nước',
            'induction-cooker': 'Bếp từ'
        }

        res.render('./pages/index', { productCatalog })
    }

    productDetail(req, res) {
        const title = 'Chi tiết sản phẩm'
        res.render('./pages/product-detail', { title })
    }

    forgotPassword(req, res) {
        const title = 'Quên mật khẩu'
        res.render('./pages/forgot-password', { title })
    }

    resetPassword(req, res) {
        const title = 'Đặt lại mật khẩu'
        res.render('./pages/reset-password', { title })
    }

    transaction(req, res) {
        const title = 'Thanh toán'
        res.render('./pages/transaction', { title })
    }
}


module.exports = new SiteController()
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

    search(req, res) {
        const searchResults = {
            'name': 'HaiYen',
            'rate': '4'
        }
        res.render('./pages/search-results', { searchResults })
    }

    productDetail(req, res) {
        const title = 'Chi tiết sản phẩm'
        res.render('./pages/product-detail', { title })
    }
}


module.exports = new SiteController()
class ProductController {
    // [GET] /
    detail(req, res) {
        const productId = req.params['productId']

        res.render('./pages/product-detail')
    }
}

module.exports = new ProductController()
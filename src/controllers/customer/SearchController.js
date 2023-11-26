const index = require('../../models/customer/index.model')
const search = require('../../models/customer/search.model')
const product = require('../../models/customer/product.model')

const searchController = () => {}

// [GET] /search/results
searchController.results = async (req, res) => {
    let header = await index.header(req)
    let header_user = await index.header_user(req)

    let productListResults = 0

    if (req.query.category_id) {
        productListResults = await search.findProductsByCateId(req, 24)
    } else {
        productListResults = await search.findProductsBySearchKey(req, 24)
    }

    
    res.status(200).render('./pages/search/results', {
        header: header,
        user: header_user,
        productListResults: productListResults,
    })
}

// [GET] /search/:productId
searchController.detail = async (req, res) => {
    let header = await index.header(req)
    let header_user = await index.header_user(req)

    let productInfo = await product.getProductInfo(req)
    let productImgs = await product.getProductImgs(req)
    let productDetails = await product.getProductDetails(req)
    let productFeedbacks = await product.getProductFeedbacks(req)
    let cateProducts = await index.getCateProducts(req, 8)

    res.render('./pages/search/detail', {
        user: header_user,
        header: header,
        productInfo: productInfo,
        productImgs: productImgs,
        productDetails: productDetails,
        productFeedbacks: productFeedbacks,
        cateProducts: cateProducts,
    })
}

module.exports = searchController
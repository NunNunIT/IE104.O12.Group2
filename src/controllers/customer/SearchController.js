const index = require('../../models/customer/index.model')
const search = require('../../models/customer/search.model')
const product = require('../../models/customer/product.model')
const general = require('../../models/general.model')

const searchController = () => { }

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
    let product_variant_id = req.params.product_variant_id
    let header = await index.header(req)
    let header_user = await index.header_user(req)

    let productInfo = await product.getProductInfo(product_variant_id)
    let productImgs = await product.getProductImgs(product_variant_id)
    let variantProducts = await general.getVariantProducts(product_variant_id)
    let productDetails = await product.getProductDetails(product_variant_id)
    let productFeedbacks = await product.getProductFeedbacks(product_variant_id)
    let cateProducts = await general.getCateProducts(req, product_variant_id, 8)

    res.render('./pages/search/detail', {
        user: header_user,
        header: header,
        product_variant_id: product_variant_id,
        productInfo: productInfo,
        productImgs: productImgs,
        variantProducts: variantProducts,
        productDetails: productDetails,
        productFeedbacks: productFeedbacks,
        cateProducts: cateProducts,
    })
}

module.exports = searchController
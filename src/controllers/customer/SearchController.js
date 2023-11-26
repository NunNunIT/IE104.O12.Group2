const index = require('../../models/customer/index.model')
const search = require('../../models/customer/search.model')

const searchController = () => {}

// [GET] /search/results
searchController.results = async (req, res) => {
    let header = await index.header(req)
    let header_user = await index.header_user(req)

    let products = await search.findProducts(req)

    console.log({
        header: header,
        user: header_user,
        products: products,
    })

    res.status(200).render('./pages/search/results', {
        header: header,
        user: header_user,
        products: products,
    })
}

// [GET] /search/:productId
searchController.detail = async (req, res) => {
    let header = await index.header(req)
    let cates = await index.getCates(req)

    let productDetail = await index.getProductDetail(req)
    let similarProducts = await index.getSimilarProducts(req)

    res.render('./pages/search/detail', {
        user: header,
        cates: cates,
        searchKey: req.query.searchKey ?? '',
        productDetail: productDetail,
        similarProducts: similarProducts,
    })
}


module.exports = searchController
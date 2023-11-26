const index = require('../../models/customer/index.model')
const search = require('../../models/customer/search.model')

const searchController = () => {}

// [GET] /search/results
searchController.results = async (req, res) => {
    let header = await index.header(req)
    let cates = await index.getCates(req)

    search.findProducts(req, function (products, totalRow, totalPage, page, searchKey, limit) {
        res.status(200).render('./pages/search/results', {
            user: header,
            cates: cates,
            products: products,
            totalRow: totalRow,
            totalPage: totalPage,
            page: parseInt(page),
            searchKey: req.query.searchKey ?? '',
            limit: limit,
        })
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
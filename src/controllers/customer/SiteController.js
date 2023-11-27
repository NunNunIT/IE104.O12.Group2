const { promisify } = require('util')

const index = require('../../models/customer/index.model')

const siteController = () => { }

// [GET] /
siteController.index = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let outstandingProducts = await index.getOutstandingProducts(req)
    let newProducts = await index.getNewProducts(req)
    let discountProducts = await index.getDiscountProducts(req)

    res.render('./pages/site/index', {
        header: header,
        user: header_user,
        outstandingProducts: outstandingProducts,
        newProducts: newProducts,
        discountProducts: discountProducts,
    })
}

//[GET] /about-us
siteController.aboutUs = async (req, res) => {
    // Tất cả trang đều chạy cái này
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/site/about-us', {
        header: header,
        user: header_user,
    })
}

//[GET] /privacy-policy
siteController.privacyPolicy = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/site/privacy-policy', {
        header: header,
        user: header_user,
    })
}

siteController.error = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)

    res.render('./pages/site/404-error', {
        header: header,
        user: header_user,
    })
}

module.exports = siteController
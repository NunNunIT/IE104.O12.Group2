const { promisify } = require('util')

const index = require('../../models/customer/index.model')
const general = require('../../models/general.model')

const siteController = () => { }

// [GET] /
siteController.index = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let outstandingProducts = await general.getOutstandingProducts(req)
    let newProducts = await general.getNewProducts(req)
    let discountProducts = await general.getDiscountProducts(req)
    let formatFunction = await general.formatFunction()

    res.status(200).render('./pages/site/index', {
        header: header,
        user: header_user,
        outstandingProducts: outstandingProducts,
        newProducts: newProducts,
        discountProducts: discountProducts,
        formatFunction: formatFunction,
    })
}

//[GET] /about-us
siteController.aboutUs = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.status(200).render('./pages/site/about-us', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

//[GET] /privacy-policy
siteController.privacyPolicy = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.status(200).render('./pages/site/privacy-policy', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

// [GET] /error
siteController.error = async (req, res) => {
    res.status(200).render('./pages/site/404-error')
}

// [GET] /category
siteController.category = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let formatFunction = await general.formatFunction()

    res.status(200).render('./pages/site/category-mobile', {
        header: header,
        user: header_user,
        formatFunction: formatFunction,
    })
}

// [GET] /feature_development
siteController.development = async (req, res) => {
    res.status(503).render('./pages/site/feature_development')
}

module.exports = siteController

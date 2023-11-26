const {
    promisify
} = require('util')

const index = require('../../models/customer/index.model')

const siteController = () => { }

// [GET] /
siteController.index = async (req, res) => {
    let header_user = await index.header_user(req)
    let header = await index.header(req)
    let outstandingProducts = await index.getOutstandingProducts(req)
    let newProducts = await index.getNewProducts(req)
    let discountProducts = await index.getDiscountProducts(req)

    console.log(header_user)
    res.render('./pages/site/index', {
        header: header,
        user: header_user,
        outstandingProducts: outstandingProducts,
        newProducts: newProducts,
        discountProducts: discountProducts,
    })

}

//[GET] /about-us
siteController.aboutUs = (req, res) => {
    res.render('./pages/site/about-us', {
        user: (req.user) ? req.user : 0
    })
}

//[GET] /privacy-policy
siteController.privacyPolicy = (req, res) => {
    res.render('./pages/site/privacy-policy', {
        user: (req.user) ? req.user : 0
    })
}

siteController.error = (req, res) => {
    res.render('./pages/site/404-error', {
        user: (req.user) ? req.user : 0
    })
}


module.exports = siteController
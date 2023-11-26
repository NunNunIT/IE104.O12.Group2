const { promisify } = require('util')

const index = require('../../models/customer/index.model')

const siteController = () => { }

// [GET] /
siteController.index = async (req, res) => {
    let header;
    if (req.user) {
        header = await index.header(req)
    }

    index.getCate(function (err, cate) {
        index.getOutstandingProducts(function (err, outstandingProducts) {
            index.getNewProducts(function (err, newProducts) {
                index.getDiscountProducts(function (err, discountProducts) {
                    console.log(cate[0], outstandingProducts[0], newProducts[0], discountProducts[0])
                    res.render('./pages/site/index', {
                        user: (header) ? header : 0,
                        searchKey: req.query.searchKey ?? '',
                        cates: cate,
                        outstandingProducts: outstandingProducts,
                        newProducts: newProducts,
                        discountProducts: discountProducts,
                    })
                })
            })
        })
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
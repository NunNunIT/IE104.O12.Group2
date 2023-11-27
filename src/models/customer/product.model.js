const general = require('../../models/general.model')
const index = require('../../models/customer/index.model')
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)


const product = function () { }

product.getProductId = async (req) => {
    let params = req.params.product_variant_id
    let getProductId = `SELECT product_id FROM product_variants WHERE product_variant_id = ${params}`

    let product_id = await query(getProductId)
    return product_id[0].product_id
}

product.getCategoryId = async (req) => {
    let params = req.params.product_variant_id

    let getCategoryId = `SELECT category_id FROM view_products WHERE product_id = ${params}`

    let category_id = await query(getCategoryId)
    return category_id[0].category_id
}

product.getProductInfo = async (req) => {
    let params = req.params.product_variant_id
    let product_id = await product.getProductId(req)

    let getProductInfo = `SELECT * FROM products WHERE product_id = ${product_id} LIMIT 0, 1`
    let productInfo = await query(getProductInfo)
    return productInfo[0]
}

product.getProductDetails = async (req) => {
    let params = req.params.product_variant_id
    let product_id = await product.getProductId(req)

    let getProductDetails = `SELECT * FROM product_details WHERE product_id = ${product_id}`

    return new Promise((resolve, reject) => {
        db.query(getProductDetails, (err, productDetails) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(productDetails)
            }
        })
    })
}

product.getProductImgs = async (req) => {
    let params = req.params.product_variant_id
    let product_id = await product.getProductId(req)

    let getProductImgs = `SELECT * FROM product_imgs WHERE product_id = ${product_id}`

    return new Promise((resolve, reject) => {
        db.query(getProductImgs, (err, productImgs) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                console.log(productImgs)
                resolve(productImgs)
            }
        })
    })
}

product.getProductFeedbacks = async (req) => {
    let params = req.params.product_variant_id
    let product_id = await product.getProductId(req)

    let getProductFeedbacks = `SELECT * FROM view_product_feedbacks WHERE product_id = ${product_id}`

    return new Promise((resolve, reject) => {
        db.query(getProductFeedbacks, (err, productFeedbacks) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(productFeedbacks)
            }
        })
    })
}

module.exports = product


const general = require('../../models/general.model')
const index = require('../../models/customer/index.model')
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)


const product = function () { }

product.getProductInfo = async (product_variant_id) => {
    let product_id = await general.getProductId(product_variant_id)

    let getProductInfo = `SELECT * FROM products WHERE product_id = ${product_id} LIMIT 0, 1`
    let productInfo = await query(getProductInfo)
    return productInfo[0]
}

product.getProductDetails = async (product_variant_id) => {
    let product_id = await general.getProductId(product_variant_id)

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

product.getProductImgs = async (product_variant_id) => {
    let product_id = await general.getProductId(product_variant_id)

    let getProductImgs = `SELECT * FROM product_imgs WHERE product_id = ${product_id}`

    return new Promise((resolve, reject) => {
        db.query(getProductImgs, (err, productImgs) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(productImgs)
            }
        })
    })
}

product.getProductFeedbacks = async (product_variant_id) => {
    let product_id = await general.getProductId(product_variant_id)

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


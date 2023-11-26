const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../../models/general.model')

const product = function () {}

product.getProductId = async (req) => {
    let params = req.params.product_variant_id
    let getProductId = `SELECT product_id FROM product_variants WHERE product_variant_id = ${params}`

    let product_id = await query(getProductId)
    console.log(product_id)
    return product_id
}

product.getProductInfo = async (req) => {
    let params = req.params.product_variant_id
    let product_id = await product.getProductId(req)

    let getProductInfo = `SELECT * FROM products WHERE product_id = ${product_id} LIMIT 0, 1`
    let productInfo = await query(getProductInfo)[0]
    return productInfo
}

product.getProductDetails = async (req) => {
    let params = req.params.product_variant_id
    let getProductId = await query(`SELECT product_id FROM product_variants WHERE product_variant_id = ${params}`)
    console.log('productId:', getProductId)
    let getProductDetails = `SELECT * FROM product_details WHERE product_id = ${getProductId}`

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

module.exports = product


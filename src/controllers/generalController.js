const { promisify } = require('util')
const index = require('../models/customer/index.model')
const order = require('../models/customer/order.model')
const general = require('../models/general.model')

const generalController = () => { }

// [GET] /general/product_variant_info?product_variant_id=x
generalController.getProductVariantInfo = async (req, res) => {
    let product_variant_id = req.query.product_variant_id
    let productVariantInfo = await general.getVariantProduct(product_variant_id)

    if (productVariantInfo) {
        return res.status(200).json({
            status: 'success',
            productVariantInfo: productVariantInfo,
        })
    } else {
        return res.status(404).json({
            status: 'error',
        })
    }
}

// [GET] /general/count_cart
generalController.getCountCart = async (req, res) => {
    let customer_id = req.user.customer_id

    let countCart = await index.getCountCart(customer_id)

    if (countCart) {
        return res.status(200).json({
            status: 'success',
            countCart: countCart,
        })
    } else {
        return res.status(404).json({
            status: 'error',
            countCart: 0,
        })
    }
}

module.exports = generalController
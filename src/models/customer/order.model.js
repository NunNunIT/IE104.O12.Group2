const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../general.model');
const index = require('./index.model')

const order = function () { }

order.addCart = async (customer_id, product_variant_id, cart_quantity) => {
    
    let findCart = `SELECT * FROM carts WHERE customer_id = ${customer_id} AND product_variant_id = ${product_variant_id}`
    let updateCart = `UPDATE carts SET cart_quantity = cart_quantity + ${cart_quantity} WHERE customer_id = ${customer_id} AND product_variant_id = ${product_variant_id}`
    let addCart = `INSERT INTO carts (customer_id, product_variant_id, cart_quantity) VALUES (${customer_id}, ${product_variant_id}, ${cart_quantity})`

    let find = await query(findCart)
    if (find[0]){
            await query(updateCart) 
        } else {
            await db.query(addCart)
        }
    return 1

}

order.getDetailCart = async (customer_id) => {
    let getlistCart = `SELECT * FROM view_cart WHERE customer_id = ${customer_id}`

    let listCart = await query(getlistCart)
    listCart = await general.productCurrencyFormat(listCart)

    return new Promise(async (resolve, reject) => {
        const promises = [];
        listCart.forEach(async(cart) => {
        promises.push(
            general.getVariantProducts(cart.product_variant_id).then((variant) => {
                cart.cart_product_variant = variant
            })
        );
        })
        await Promise.all(promises);
        resolve(listCart);
    })
}

order.cartDelete = async (order_informations) => {
    let cartDelete = ``
}

module.exports = order
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../general.model');
const index = require('./index.model')

const order = function () { }

order.addCart = async (customer_id, product_variant_id, cart_quantity) => {

    let findCart = `SELECT * FROM carts WHERE customer_id = ${customer_id} AND product_variant_id = ${product_variant_id}`
    let updateCart = `UPDATE carts SET cart_quantity = cart_quantity + ${cart_quantity}, cart_added_date = current_timestamp() WHERE customer_id = ${customer_id} AND product_variant_id = ${product_variant_id}`
    let addCart = `INSERT INTO carts (customer_id, product_variant_id, cart_quantity) VALUES (${customer_id}, ${product_variant_id}, ${cart_quantity})`

    let find = await query(findCart)
    if (find[0]) {
        await query(updateCart)
    } else {
        await query(addCart)
    }
    return 1
}

order.getDetailCart = async (customer_id) => {
    let getlistCart = `SELECT * FROM view_cart WHERE customer_id = ${customer_id}`

    let listCart = await query(getlistCart)

    return new Promise(async (resolve, reject) => {
        const promises = [];
        listCart.forEach(async (cart) => {
            promises.push(
                general.getProductVariants(cart.product_variant_id).then((variant) => {
                    cart.cart_product_variant = variant
                })
            );
        })
        await Promise.all(promises);
        resolve(listCart);
    })
}

order.deleteCart = function (customer_id, productsDeleteCart, callback) {
    let deleteCart = `DELETE FROM carts WHERE customer_id = ${customer_id} AND product_variant_id = ${productsDeleteCart[0].product_variant_id}`

    for (let i = 1; i < productsDeleteCart.length; i++) {
        deleteCart += ` OR product_variant_id = ${productsDeleteCart[i].product_variant_id}`
    }

    db.query(deleteCart, (err, result) => {
        if (err) {
            console.error(err);
            callback(1, 0)
        } else {
            callback(0, 1)
        }
    })
}

order.updateCart = async function (customer_id, productsUpdateCart, callback) {
    productsUpdateCart.forEach(async product => {
        await order.addCart(customer_id, product.product_variant_id, product.cart_quantity)
    })
}

order.insertOrder = function (customer_id, orderInfo, orderDetails, callback) {
    let insertOrder = ''
    if (orderInfo.paying_method_id != 1) {
        insertOrder = `INSERT INTO orders (customer_id, order_name, order_phone, order_delivery_address, order_note, paying_method_id)
                        VALUES (${customer_id}, ? , '${orderInfo.order_phone}', ? , ? , ${orderInfo.paying_method_id})`
    } else {
        insertOrder = `INSERT INTO orders (customer_id, order_name, order_phone, order_delivery_address, order_note, paying_method_id, order_is_paid, order_paying_date, order_status)
                        VALUES (${customer_id}, ? , '${orderInfo.order_phone}', ? , ? , 1, 1, ${new Date().getDate()} ,'Đang giao hàng')`
    }

    db.query(insertOrder, [orderInfo.order_name, orderInfo.order_delivery_address, orderInfo.order_note], (err, result) => {
        if (err) {
            console.error(err);
            callback(1, 0, 0, 0);
        } else {
            let order_id = result.insertId ?? 0;

            order.insertOrderDetails(order_id, orderDetails, function (error, success) {
                if (error) {
                    console.log(error);
                    callback(1, 0, 0, 0);
                } else {
                    callback(0, 1, order_id);
                }
            })
        }
    })
}

order.insertOrderDetails = async (order_id, orderDetails, callback) => {
    let insertOrderDetails = `INSERT INTO order_details (order_id, product_variant_id, order_detail_quantity) 
    VALUES (${order_id}, ${orderDetails[0].product_variant_id}, ${orderDetails[0].order_detail_quantity})`

    for (let i = 1; i < orderDetails.length; i++) {
        insertOrderDetails += ` ,(${order_id}, ${orderDetails[i].product_variant_id}, ${orderDetails[i].order_detail_quantity})`
    }

    db.query(insertOrderDetails, (err, result) => {
        if (err) {
            console.log(err);
            callback(1, 0)
        } else {
            callback(0, 1)
        }
    })
}

order.updateCancelOrder = async (order_id, callback) => {
    let updateCancelOrder = `UPDATE orders 
                            SET orders.order_status = 'Đã hủy'
                            WHERE orders.order_id = ${order_id}`
    db.query(updateCancelOrder, (err, result) => {
        if (err) {
            console.log(err);
            callback(1, 0);
        } else {
            callback(0, 1);
        }
    })
}

module.exports = order
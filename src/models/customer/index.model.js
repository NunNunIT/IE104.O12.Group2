const db = require('../../config/db/connect')
const general = require('../../models/general.model')

const index = function () {}

index.getCate = function (callback) {
    let getCate = "SELECT * FROM categories"
    return db.query(getCate, (err, cate) => {
        if (err) {
            console.log(err)
            return callback(1, 0)
        } else {
            return callback(0, cate)
        }
    })
}

index.getOutstandingProducts = function (callback) {
    let getOutstandingProducts = "SELECT * FROM view_products ORDER BY product_view_count DESC LIMIT 0, 7"

    db.query(getOutstandingProducts, (err, outstandingProducts) => {
        if (err) {
            console.log(err)
            callback(1, 0)
        } else {
            outstandingProducts.forEach((product) => {
                product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                if (product.discount_amount) {
                    product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                    product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                }
            })
            callback(0, outstandingProducts)
        }
    })
}

index.getNewProducts = function (callback) {
    let getNewProducts = "SELECT * FROM view_new_products ORDER BY product_lastdate_added DESC"

    db.query(getNewProducts, (err, newProducts) => {
        if (err) {
            console.log(err)
            callback(1, 0)
        } else {
            newProducts.forEach((product) => {
                product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                if (product.discount_amount) {
                    product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                    product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                }
            })
            callback(0, newProducts)
        }
    })
}

index.getDiscountProducts = function (callback) {
    let getDiscountProducts = "SELECT * FROM view_products ORDER BY discount_amount DESC"

    db.query(getDiscountProducts, (err, discountProducts) => {
        if (err) {
            console.log(err)
            callback(1, 0)
        } else {
            discountProducts.forEach((product) => {
                product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                if (product.discount_amount) {
                    product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                    product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                }
            })
            callback(0, discountProducts)
        }
    })
}

index.getCountCart = async (req) => {
    let getCountCart = "SELECT * FROM view_count_cart WHERE user_id = ?";
    const param = req.user.user_id;

    return new Promise((resolve, reject) => {
        db.query(getCountCart, param, (err, countCart) => {
            if (err) {
                console.log(err);
                resolve(0);
            } else {
                resolve(countCart[0].count_cart);
            }
        });
    });
};

index.getCountCart = async (req) => {
    let getCountCart = "SELECT * FROM view_count_cart WHERE user_id = ?";
    const param = req.user.user_id;

    return new Promise((resolve, reject) => {
        db.query(getCountCart, param, (err, countCart) => {
            if (err) {
                console.log(err);
                resolve(0);
            } else {
                resolve(countCart[0].count_cart);
            }
        });
    });
};

index.getDetailCart = async (req) => {
    let getDetailCart = `SELECT * FROM view_cart WHERE customer_id = ?`;
    const param = req.user.customer_id;

    return new Promise((resolve, reject) => {
        db.query(getDetailCart, param, (err, detailCart) => {
            if (err) {
                console.log(err);
                resolve(0);
            } else {
                detailCart.forEach((product) => {
                    product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                    if (product.discount_amount) {
                        product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                        product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                    }
                })
                resolve(detailCart);
            }
        });
    });
};

index.header = async (req) => {
    let user = req.user
    let countCart = await index.getCountCart(req)
    let detailCarts = await index.getDetailCart(req)
    // console.log(user, countCart, detailCart)
    let headers = {user, countCart, detailCarts}
    return (headers);
}

module.exports = index
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../../models/general.model')

const index = function () {}

index.getCates = async (callback) => {
    let getCate = "SELECT * FROM categories"
    return new Promise((resolve, reject) => {
        return db.query(getCate, (err, cates) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(cates)
            }
        })
    })
}

index.getOutstandingProducts = async (callback) => {
    let getOutstandingProducts = "SELECT * FROM view_products ORDER BY product_view_count DESC LIMIT 0, 7"

    return new Promise((resolve, reject) => {
        db.query(getOutstandingProducts, (err, outstandingProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                outstandingProducts.forEach((product) => {
                    product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                    if (product.discount_amount) {
                        product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                        product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                    }
                })
                resolve(outstandingProducts)
            }
        })
    })
}

index.getNewProducts = async (callback) => {
    let getNewProducts = "SELECT * FROM view_new_products ORDER BY product_lastdate_added DESC"

    return new Promise((resolve, reject) => {
    db.query(getNewProducts, (err, newProducts) => {
        if (err) {
            console.log(err)
            resolve(0)
        } else {
            newProducts.forEach((product) => {
                product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                if (product.discount_amount) {
                    product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                    product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                }
            })
            resolve(newProducts)
        }
    })
    })
}

index.getDiscountProducts = async (callback) => {
    let getDiscountProducts = "SELECT * FROM view_products ORDER BY discount_amount DESC"

    return new Promise((resolve, reject) => {
    db.query(getDiscountProducts, (err, discountProducts) => {
        if (err) {
            console.log(err)
            resolve(0)
        } else {
            discountProducts.forEach((product) => {
                product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                if (product.discount_amount) {
                    product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                    product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                }
            })
            resolve(discountProducts)
        }
    })
    })
}

index.getProductDetail = async (req, callback) => {
    let params = req.params.product_variant_id
    let getProductDetail = `SELECT * FROM view_products WHERE product_variant_id = ${params}`

    return new Promise((resolve, reject) => {
        db.query(getProductDetail, (err, productDetail) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                productDetail.forEach((product) => {
                    product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                    if (product.discount_amount) {
                        product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                        product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                    }
                })
                resolve(productDetail)
            }
        })
    })
}

index.getSimilarProducts = async (req) => {
    let params = req.query.category_id
    let getSimilarProducts = `SELECT * FROM view_products WHERE category_id = ${params}`

    return new Promise((resolve, reject) => {
        db.query(getSimilarProducts, (err, similarProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                similarProducts.forEach((product) => {
                    product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
                    if (product.discount_amount) {
                        product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
                        product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
                    }
                })
                resolve(similarProducts)
            }
        })
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
    if (req.user) {
        let user = req.user
        let countCart = await index.getCountCart(req)
        let detailCarts = await index.getDetailCart(req)
        // console.log(user, countCart, detailCart)
        let headers = {
            user,
            countCart,
            detailCarts
        }
        return (headers);
    } else {
        return 0
    }
}

module.exports = index
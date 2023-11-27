const general = require('../../models/general.model')
const product = require('../../models/customer/product.model')
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)


const index = async function () {}

index.productCurrencyFormat = async (products) => {
    products.forEach((product) => {
        product.product_variant_price_currency = general.toCurrency(Number(product.product_variant_price))
        if (product.discount_amount) {
            product.product_variant_price_after_discount = product.product_variant_price * (100 - product.discount_amount) / 100
            product.product_variant_price_after_discount_currency = general.toCurrency(Number(product.product_variant_price_after_discount))
        }
    })
    return products
}

index.getCates = async (req) => {
    let getCate = `SELECT categories.*, COUNT(product_id) AS category_count
                FROM categories LEFT JOIN products
                ON products.category_id = categories.category_id
                AND category_is_display = 1
                GROUP by category_id;
                 `

    return new Promise((resolve, reject) => {
        db.query(getCate, async (err, cates) => {
            if (err) {
                console.log(err)
                resolve(0)
            }
            const promises = [];
            cates.forEach(async (cate) => {
                promises.push(
                    index.getBestSellerProductsOfCates(Number(cate.category_id), 3).then((bestSellerProducts) => {
                        cate.bestSellerProductsOfCates = bestSellerProducts;
                    })
                );
            });

            await Promise.all(promises);
            resolve(cates);
        })
    })
}

index.getBestSellerProductsOfCates = async (category_id, limit) => {
    let getBestSellerProductsOfCates = `SELECT * FROM view_products 
                            WHERE category_id = ${category_id} 
                            ORDER BY product_variant_is_bestseller DESC
                            LIMIT 0, ${limit}`

    return new Promise((resolve, reject) => {
        db.query(getBestSellerProductsOfCates, (err, bestSellerProductsOfCates) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                bestSellerProductsOfCates = index.productCurrencyFormat(bestSellerProductsOfCates)
                // console.log(bestSellerProductsOfCates)
                resolve(bestSellerProductsOfCates)
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
                outstandingProducts = index.productCurrencyFormat(outstandingProducts)
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
                newProducts = index.productCurrencyFormat(newProducts)
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
                discountProducts = index.productCurrencyFormat(discountProducts)
                resolve(discountProducts)
            }
        })
    })
}

index.getCateProducts = async (req, limit = 8) => {
    let category_id = await product.getCategoryId(req)
    category_id = (req.query.category_id) != 0 ? req.query.category_id : category_id

    let getCateProducts = `SELECT * FROM view_products 
                            WHERE category_id = ${category_id} 
                            ORDER BY product_variant_is_bestseller DESC
                            LIMIT 0, ${limit}`

    return new Promise((resolve, reject) => {
        db.query(getCateProducts, (err, cateProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                cateProducts = index.productCurrencyFormat(cateProducts)
                resolve(cateProducts)
            }
        })
    })
}

index.getVariantProducts = async (req) => {
    let params = req.params.product_variant_id
    let product_id = await product.getProductId(req)

    let getVariantProducts = `SELECT * FROM view_product_variant_detail WHERE product_id = ${product_id}`

    return new Promise((resolve, reject) => {
        db.query(getVariantProducts, (err, variantProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                variantProducts = index.productCurrencyFormat(variantProducts)
                // console.log(variantProducts)
                resolve(variantProducts)
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
                detailCart = index.productCurrencyFormat(detailCart)
                resolve(detailCart);
            }
        });
    });
};

index.header_user = async (req) => {
    if (req.user) {
        let user = req.user
        let countCart = await index.getCountCart(req)
        let detailCarts = await index.getDetailCart(req)
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

index.header = async (req) => {
    let searchKey = req.query.searchKey ?? ''
    let cates = await index.getCates(req)
    let header = {
        searchKey,
        cates
    }
    return (header)
}

module.exports = index
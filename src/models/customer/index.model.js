const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../../models/general.model')
const product = require('../../models/customer/product.model')

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


index.getCateProducts = async (req, limit) => {
    let category_id = await product.getCategoryId(req)

    let getRowSQL = `SELECT COUNT(*) as total FROM view_products WHERE category_id = ${category_id}`
    let getCateProducts = `SELECT * FROM view_products WHERE category_id = ${category_id}`
    

    let searchKey = req.query.searchKey

    // lấy trạng hiện tại page=?
    let page = req.query.page ? req.query.page : 1

    //truy vấn tính tổng số dòng trong một bảng
    let rowData = await query(getRowSQL)
    console.log ('rowData', rowData)
    let totalRow = rowData[0].total

    // tính số trang thực tế sẽ có
    let totalPage = totalRow > 0 ? Math.ceil(totalRow / limit) : 1
    // Kiểm tra đảm bảo rằng page là số nguyên hợp lệ từ 1 đến totalPage
    page = page > 0 ? Math.floor(page) : 1
    page = page <= totalPage ? Math.floor(page) : totalPage

    let start = (page - 1) * limit

    return new Promise((resolve, reject) => {
        db.query(getCateProducts, (err, cateProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                cateProducts = index.productCurrencyFormat(cateProducts)
                resolve(cateProducts, totalRow, totalPage, page, searchKey, limit)
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

index.header = async (req) => {
    let searchKey = req.query.searchKey ?? ''
    let cates = await index.getCates(req)
    let header = {searchKey, cates}
    return (header)
}

module.exports = index
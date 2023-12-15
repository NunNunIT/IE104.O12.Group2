const db = require('../config/db/connect');
const util = require('node:util')
const query = util.promisify(db.query).bind(db)

const general = function () { }

// Hàm xử lý datetỉme ---> Thứ x, ngày x tháng x năm x
general.toXDDMMYYYY = function (datetime) {
    let day = ''
    switch (datetime.getDay()) {
        case 0:
            day = 'Chủ nhật'
            break

        case 1:
            day = 'Thứ hai'
            break

        case 2:
            day = 'Thứ ba'
            break

        case 3:
            day = 'Thứ tư'
            break

        case 4:
            day = 'Thứ năm'
            break

        case 5:
            day = 'Thứ sáu'
            break

        case 6:
            day = 'Thứ bảy'
            break

    }

    let date = datetime.getDate()
    if (date < 10) {
        date = "0" + datetime.getDate();
    }

    let year = datetime.getYear() + 1900
    return (day + ', ngày ' + datetime.getDate() + ' tháng ' + datetime.getMonth() + ' năm ' + year)
}

// Hàm xử lý datetime ---> DD tháng MM năm YYYY
general.toDDthangMMnamYYYY = function (datetime) {
    let date = datetime.getDate()
    if (date < 10) {
        date = "0" + datetime.getDate();
    }
    let year = datetime.getYear() + 1900
    return (datetime.getDate() + ' tháng ' + datetime.getMonth() + ' năm ' + year)
}

// Hàm xử lý datetime ---> DD/MM/YYYY
general.toDDMMYYYY = function (datetime) {
    let date = datetime.getDate()
    if (date < 10) {
        date = "0" + datetime.getDate()
    }
    let month = datetime.getMonth()
    if (month < 10) {
        month = "0" + datetime.getMonth()
    }
    let year = datetime.getYear() + 1900
    return (date + '/' + month + '/' + year)
}

// Hàm xử lý datetime ---> DD tháng MM HH:MM
general.toDDMMYYYYHHMM = function (datetime) {
    let date = datetime.getDate()
    if (date < 10) {
        date = "0" + datetime.getDate();
    }
    let year = datetime.getYear() + 1900
    return (date + ' tháng ' + datetime.getMonth() + ' năm ' + year + ' ' + general.toHHMM(datetime))
}

// Hàm xử lý datetime ---> giờ:phút
general.toHHMM = function (datetime) {
    let hour = datetime.getHours()
    if (hour < 10) {
        hour = "0" + datetime.getHours();
    }

    let minute = datetime.getMinutes()
    if (minute < 10) {
        minute = "0" + datetime.getMinutes();
    }

    return (hour + ':' + minute)
}

general.toCurrency = function (money) {
    let currency = money.toFixed(0).replace(/./g, function (c, i, a) {
        return i > 0 && c !== "," && (a.length - i) % 3 === 0 ? "." + c : c;
    });
    return currency + 'đ';
}

general.getProductId = async (product_variant_id) => {
    let getProductId = `SELECT product_id FROM product_variants WHERE product_variant_id = ${product_variant_id}`

    let product_id = await query(getProductId)
    return product_id[0].product_id
}

general.getCategoryId = async (product_id) => {

    let getCategoryId = `SELECT category_id FROM view_product_variants WHERE product_id = ${product_id}`

    let category_id = await query(getCategoryId)
    return category_id[0].category_id
}

general.getCates = async (req) => {
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
                    general.getBestSellerProductsOfCates(Number(cate.category_id), 8).then((bestSellerProducts) => {
                        cate.bestSellerProductsOfCates = bestSellerProducts;
                    })
                );
            });

            await Promise.all(promises);
            resolve(cates);
        })
    })
}

general.getBestSellerProductsOfCates = async (category_id, limit) => {
    let getBestSellerProductsOfCates = `SELECT * FROM view_products_resume 
                            WHERE category_id = ${category_id} 
                            ORDER BY product_variant_is_bestseller DESC
                            LIMIT 0, ${limit}`

    return new Promise((resolve, reject) => {
        db.query(getBestSellerProductsOfCates, (err, bestSellerProductsOfCates) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(bestSellerProductsOfCates)
            }
        })
    })
}

general.getOutstandingProducts = async () => {
    let getOutstandingProducts = "SELECT * FROM view_products_resume ORDER BY product_view_count DESC LIMIT 0, 7"

    return new Promise((resolve, reject) => {
        db.query(getOutstandingProducts, (err, outstandingProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(outstandingProducts)
            }
        })
    })
}

general.getNewProducts = async () => {
    let getNewProducts = "SELECT * FROM view_products_resume ORDER BY product_lastdate_added DESC"

    return new Promise((resolve, reject) => {
        db.query(getNewProducts, (err, newProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(newProducts)
            }
        })
    })
}

general.getDiscountProducts = async () => {
    let getDiscountProducts = "SELECT * FROM view_product_variants WHERE discount_amount IS NOT NULL ORDER BY discount_amount DESC"

    return new Promise((resolve, reject) => {
        db.query(getDiscountProducts, (err, discountProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(discountProducts)
            }
        })
    })
}

general.getCateProducts = async (req, product_variant_id, limit = 8) => {
    let product_id = await general.getProductId(product_variant_id)
    let category_id = await general.getCategoryId(product_id)
    category_id = (req.query.category_id) ? req.query.category_id : category_id

    let getCateProducts = `SELECT * FROM view_products_resume 
                            WHERE category_id = ${category_id} 
                            ORDER BY product_variant_is_bestseller DESC
                            LIMIT 0, ${limit}`

    return new Promise((resolve, reject) => {
        db.query(getCateProducts, (err, cateProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(cateProducts)
            }
        })
    })
}

general.getNotCateProducts = async (req, product_variant_id, limit = 8) => {
    let product_id = await general.getProductId(product_variant_id)
    let category_id = await general.getCategoryId(product_id)
    category_id = (req.query.category_id) ? req.query.category_id : category_id

    let getNotCateProducts = `SELECT * FROM view_products_resume 
                            WHERE NOT(category_id = ${category_id}) 
                            ORDER BY product_variant_is_bestseller DESC
                            LIMIT 0, ${limit}`

    return new Promise((resolve, reject) => {
        db.query(getNotCateProducts, (err, notCateProducts) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(notCateProducts)
            }
        })
    })
}


general.getVariantProduct = async (product_variant_id) => {
    // let params = req.params.product_variant_id
    let product_id = await general.getProductId(product_variant_id)

    let getVariantProduct = `SELECT * FROM view_product_variants WHERE product_variant_id = ${product_variant_id}`

    return new Promise((resolve, reject) => {
        db.query(getVariantProduct, (err, variantProduct) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(variantProduct)
            }
        })
    })
}

general.getProductVariants = async (product_variant_id) => {
    // let params = req.params.product_variant_id
    let product_id = await general.getProductId(product_variant_id)

    let getProductVariants = `SELECT * FROM view_product_variant_detail WHERE product_id = ${product_id}`

    return new Promise((resolve, reject) => {
        db.query(getProductVariants, (err, productVariants) => {
            if (err) {
                console.log(err)
                resolve(0)
            } else {
                resolve(productVariants)
            }
        })
    })
}

general.formatFunction = async () => {
    let formatFunction = {
        toCurrency: general.toCurrency,
        toDDMMYYYY: general.toDDMMYYYY,
        toHHMM: general.toHHMM,
    }

    return formatFunction;
}


module.exports = general;
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../../models/general.model');
const index = require('../../models/customer/index.model')

const search = function () { }

search.findProductsBySearchKey = async (req, limit = 24) => {
    // lấy từ khóa searchKey=?
    const searchKey = req.query.searchKey ?? 0

    let getRowSQL = `SELECT COUNT(*) as total FROM view_products_resume`
    let getProductsSQL = `SELECT * FROM view_products_resume`

    if (req.query.hotProduct && req.query.newProduct) {
        getProductsSQL += ` ORDER BY product_variant_is_bestseller DESC, product_view_count DESC, product_lastdate_added DESC`
    } else if (req.query.hotProduct || req.query.newProduct) {
        getProductsSQL += ` ORDER BY`
        if (req.query.hotProduct) {
            getProductsSQL += ` product_variant_is_bestseller DESC, product_view_count DESC`
        } else if (req.query.newProduct) {
            getProductsSQL += ` product_lastdate_added DESC`
        }
    }

    if (searchKey && req.query.discount) {
        getProductsSQL += ` WHERE product_name LIKE ? OR category_name LIKE ? AND discount_amount IS NOT NULL`
        getRowSQL += ` WHERE product_name LIKE ? OR category_name LIKE ? AND discount_amount IS NOT NULL`
    } else if (searchKey || req.query.discount) {
        getProductsSQL += ` WHERE`
        getRowSQL += ` WHERE`
        if (searchKey) {
            getProductsSQL += ` product_name LIKE ? OR category_name LIKE ?`
            getRowSQL += ` product_name LIKE ? OR category_name LIKE ?`
        } else {
            getProductsSQL += ` discount_amount IS NOT NULL`
            getRowSQL += ` discount_amount IS NOT NULL`
        }
    }

    // lấy trạng hiện tại page=?
    let page = req.query.page ? req.query.page : 1

    //truy vấn tính tổng số dòng trong một bảng
    let rowData = await query(getRowSQL, [`%${searchKey}%`, `%${searchKey}%`])
    let totalRow = rowData[0].total

    // tính số trang thực tế sẽ có
    let totalPage = totalRow > 0 ? Math.ceil(totalRow / limit) : 1
    // Kiểm tra đảm bảo rằng page là số nguyên hợp lệ từ 1 đến totalPage
    page = page > 0 ? Math.floor(page) : 1
    page = page <= totalPage ? Math.floor(page) : totalPage

    let start = (page - 1) * limit

    getProductsSQL += ` LIMIT ${start}, ${limit}`

    return new Promise((resolve, reject) => {
        db.query(getProductsSQL, [`%${searchKey}%`, `%${searchKey}%`], (err, products) => {
            if (err) {
                console.error(err);
                resolve(0)
            }

            let productList = {
                products,
                searchKey,
                totalRow,
                totalPage,
                page,
                limit
            }
            resolve(productList)

        })
    })
}

search.findProductsByCateId = async (req, limit = 24) => {
    // lấy từ khóa searchKey=?
    const category_id = req.query.category_id ?? 0
    const category_name = req.query.category_name ?? 0

    let getRowSQL = `SELECT COUNT(*) as total FROM view_products_resume`
    let getProductsSQL = `SELECT * FROM view_products_resume`

    if (category_id) {
        getProductsSQL += ` WHERE category_id = ${category_id} `
        getRowSQL += ` WHERE category_id = ${category_id}`
    }

    // lấy trạng hiện tại page=?
    let page = req.query.page ? req.query.page : 1

    //truy vấn tính tổng số dòng trong một bảng
    let rowData = await query(getRowSQL)
    let totalRow = rowData[0].total

    // tính số trang thực tế sẽ có
    let totalPage = totalRow > 0 ? Math.ceil(totalRow / limit) : 1
    // Kiểm tra đảm bảo rằng page là số nguyên hợp lệ từ 1 đến totalPage
    page = page > 0 ? Math.floor(page) : 1
    page = page <= totalPage ? Math.floor(page) : totalPage

    let start = (page - 1) * limit

    return new Promise((resolve, reject) => {
        db.query(getProductsSQL, (err, products) => {
            if (err) {
                console.error(err);
                resolve(0)
            }

            let productList = {
                products,
                category_id,
                category_name,
                totalRow,
                totalPage,
                page,
                limit
            }
            resolve(productList)

        })
    })
}

module.exports = search
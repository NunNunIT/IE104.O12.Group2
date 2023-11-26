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

    let getRowSQL = `SELECT COUNT(*) as total FROM view_products`
    let getProductsSQL = `SELECT * FROM view_products`

    if (searchKey) {
        getProductsSQL += ` WHERE product_name LIKE '%` + searchKey + `%'`
        getRowSQL += ` WHERE product_name LIKE '%` + searchKey + `%'`
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
            products = index.productCurrencyFormat(products)
            let productList = { products, totalRow, totalPage, page, limit }
            resolve(productList)
        })
    })
}

search.findProductsByCateId = async (req, callback) => {
    // lấy từ khóa searchKey=?
    const category_id = req.query.category_id ?? 0

    let getRowSQL = `SELECT COUNT(*) as total FROM view_products`
    let getProductsSQL = `SELECT * FROM view_products`

    if (category_id) {
        getProductsSQL += ` WHERE category_id = ${category_id} `
        getRowSQL += ` WHERE category_id = ${category_id}`
    }

    // lấy trạng hiện tại page=?
    let page = req.query.page ? req.query.page : 1

    //truy vấn tính tổng số dòng trong một bảng
    let rowData = await query(getRowSQL)
    let totalRow = rowData[0].total

    let limit = 24
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
            products = index.productCurrencyFormat(products)
            let productList = { products, totalRow, totalPage, page, limit }
            resolve(productList)
        })
    })
}

module.exports = search
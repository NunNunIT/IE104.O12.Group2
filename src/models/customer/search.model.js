const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
const general = require('../../models/general.model')

const search = function () {}

search.findProducts = async (req, callback) => {
    // lấy từ khóa searchKey=?
    const searchKey = req.query.searchKey

    let getRowSQL = "SELECT COUNT(*) as total FROM products"
    let getProductsSQL = "SELECT * FROM products"
    if (searchKey) {
        getProductsSQL += " WHERE products.product_name LIKE '%" + searchKey + "%'"
        getRowSQL += " WHERE products.product_name LIKE '%" + searchKey + "%'"
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

    db.query(getProductsSQL, (err, products) => {
        if (err) console.error(err);
        callback(products, totalRow, totalPage, page, searchKey, limit)
    })
}

module.exports = search
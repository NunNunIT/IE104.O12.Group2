const db = require('../../config/db/connect');
const util = require('node:util')
const query = util.promisify(db.query).bind(db)
const general = require('../general.model');
const indexAdmin = require('./indexAdmin.model');

const cateAdmin = function () {}

cateAdmin.getCategories = async (searchKey, page, limit) => {
    let getRowSQL = "SELECT COUNT(*) as total FROM view_cate_admin"
    let getCateSQL = "SELECT * FROM view_cate_admin"
    if (searchKey) {
        getCateSQL += " WHERE view_cate_admin.category_name LIKE '%" + searchKey + "%'"
        getCateSQL += " OR view_cate_admin.category_id LIKE '%" + searchKey + "%'"
        getRowSQL += " WHERE view_cate_admin.category_name LIKE '%" + searchKey + "%'"
        getRowSQL += " OR view_cate_admin.category_id LIKE '%" + searchKey + "%'"
    }

    //truy vấn tính tổng số dòng trong một bảng
    let rowData = await query(getRowSQL)
    let totalRow = rowData[0].total

    // tính số trang thực tế sẽ có
    let totalPage = totalRow > 0 ? Math.ceil(totalRow / limit) : 1
    // Kiểm tra đảm bảo rằng page là số nguyên hợp lệ từ 1 đến totalPage
    page = page > 0 ? Math.floor(page) : 1
    page = page <= totalPage ? Math.floor(page) : totalPage

    let start = (page - 1) * limit

    getCateSQL += " ORDER BY view_cate_admin.category_id LIMIT " + start + "," + limit;

    return new Promise((resolve, reject) => {
        db.query(getCateSQL, (err, cate) => {
            if (err) reject(err);
            let categories = {
                categories: cate,
                searchKey: searchKey,
                totalRow: totalRow,
                totalPage: totalPage,
                page: parseInt(page),
                limit: limit,
            }
            resolve(categories)
        })
    })
}

module.exports = cateAdmin
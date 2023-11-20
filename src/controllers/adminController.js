const db = require('../config/db/connect');
const bcrypt = require('bcryptjs')
const util = require('util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)
class adminController {
    // [GET] /dashboard OR /
    getDashboard(req, res) {
        const sql = 'SELECT * FROM view_dashboard';
        const sql2 = 'SELECT sum_total FROM view_total';
        db.query(sql, (err, data) => {
            if (err) throw err;
            db.query(sql2, (err, total) => {
                if (err) throw err;
                res.render('admin/dashboard_admin', {
                    title: 'DASHBOARD',
                    data: data[0],
                    total: total[0],
                });
            })
        })

    }

    // [GET] /categories_admin/searchkey=?&page=?
    async getCategory(req, res) {
        const title = 'QUẢN LÝ DANH MỤC SẢN PHẨM'
        // lấy từ khóa searchKey=?
        let searchKey = req.query.searchKey

        let getRowSQL = "SELECT COUNT(*) as total FROM categories"
        let getCateSQL = "SELECT * FROM categories"
        if (searchKey) {
            getCateSQL += " WHERE categories.category_name LIKE '%" + searchKey + "%'"
            getCateSQL += " OR categories.category_id LIKE '%" + searchKey + "%'"
            getRowSQL += " WHERE categories.category_name LIKE '%" + searchKey + "%'"
            getRowSQL += " OR categories.category_id LIKE '%" + searchKey + "%'"
        }

        // lấy trạng hiện tại page=?
        let page = req.query.page ? req.query.page : 1

        //truy vấn tính tổng số dòng trong một bảng
        let rowData = await query(getRowSQL)
        let totalRow = rowData[0].total

        let limit = 5
        // tính số trang thực tế sẽ có
        let totalPage = totalRow > 0 ? Math.ceil(totalRow / limit) : 1
        // Kiểm tra đảm bảo rằng page là số nguyên hợp lệ từ 1 đến totalPage
        page = page > 0 ? Math.floor(page) : 1
        page = page <= totalPage ? Math.floor(page) : totalPage

        let start = (page - 1) * limit

        getCateSQL += " ORDER BY categories.category_id LIMIT " + start + "," + limit;
        db.query(getCateSQL, (err, cate) => {
            if (err) throw err;
            res.status(200).render('admin/cate_admin', {
                title: title,
                categories: cate,
                totalRow: totalRow,
                totalPage: totalPage,
                page: parseInt(page),
                searchKey: searchKey,
                limit: limit,
            })
            // res.send({
            // title: title,
            // categories: cate,
            // totalRow: totalRow,
            // totalPage: totalPage,
            // page: parseInt(page),
            // searchKey: searchKey,
            // limit: limit,
            // })
        })
    }

    // [POST] /categories_admin/delete/:id
    deleteCategory(req, res) {

    }


    // [GET] /category
    getOrders(req, res) {
        const title = 'QUẢN LÝ ĐƠN HÀNG';
        const sql = 'SELECT * FROM view_dashboard';
        res.render('admin/orders_admin', {
            title
        })
    }

}

module.exports = new adminController()
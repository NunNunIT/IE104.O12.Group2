const db = require('../config/db/connect');
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

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

    // [GET] /category
    getCategory(req, res) {
        const title = 'QUẢN LÝ DANH MỤC SẢN PHẨM';
        res.render('admin/cate_admin', {
            title
        })
    }

    // [GET] /category
    getCategory(req, res) {
        const title = 'QUẢN LÝ ĐƠN HÀNG';
        const sql = 'SELECT * FROM view_dashboard';
        res.render('admin/orders_admin', {
            title
        })
    }

}

module.exports = new adminController()
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)

const authAdmin = require('../../models/admin/authAdmin.model')
class adminController {
    // [GET] admin/login
    getLogin(req, res) {
        res.status(200).render('admin/pages/login_admin')
    }
    
    // [POST] admin/login
    postLogin(req, res) {
        authAdmin.loginPost(req, function (err, noneAdmin, NotMatchPassword, success, id) {
            if (err) res.render('./pages/site/404-error')
            if (noneAdmin) {
                return res.json({
                    status: 'error',
                    error: 'Tên đăng nhập không tồn tại.'
                })
            }

            if (NotMatchPassword) {
                return res.json({
                    status: 'error2',
                    error: 'Mật khẩu không chính xác.'
                })
            }

            if (success) {
                const token = jwt.sign({
                    id
                }, process.env.JWT_SECRET, {
                    expiresIn: process.env.JWT_EXPIRES
                });

                console.log("the token is " + token);

                const cookieOptions = {
                    expires: new Date(
                        Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 1000
                    ),
                    httpOnly: true
                }
                res.cookie('adminSave', token, cookieOptions)
                res.json({
                    status: 'success',
                    success: 'Bạn đã đăng nhập thành công'
                })
            }
        })
    }
    
    getLogout = (req, res) => {
        console.log('Admin logout')
        res.cookie('adminSave', 'logout', {
            expires: new Date(Date.now() + 2 * 1000),
            httpOnly: true
        });
        res.status(200).render("./admin/pages/login_admin");
    }
    
    // [GET] admin/dashboard OR admin/
    getDashboard(req, res) {
        const sql = 'SELECT * FROM view_dashboard';
        const sql2 = 'SELECT sum_total FROM view_total';
        db.query(sql, (err, data) => {
            if (err) throw err;
            db.query(sql2, (err, total) => {
                if (err) throw err;
                res.render('admin/pages/dashboard_admin', {
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
            res.status(200).render('admin/pages/cate_admin', {
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
        res.render('admin/pages/orders_admin', {
            title
        })
    }

}

module.exports = new adminController()
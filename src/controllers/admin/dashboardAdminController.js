const dashboard = require('../../models/admin/dashboardAdmin.model')
const general = require('../../models/general.model')

const dashboardController = () => { }

// [GET] admin/dashboard OR admin/
dashboardController.getDashboard = async (req, res) => {
    const title = 'DASHBOARD'
    let admin = req.admin
    let summary = await dashboard.getSummary()
    res.status(200).render('./admin/pages/dashboard_admin', {
        admin: admin,
        title: title,
        summary: summary,
        toCurrency: general.toCurrency,
    })
}

dashboardController.getChart = async (req, res) => {
    // let chartTop5 = ''
    // let chartRevenue = ''

    let chartTop5 = await dashboard.getChartTop5()
    let chartRevenue = await dashboard.getChartRevenue()

    return res.json({
        status: 'success',
        chartTop5Data: chartTop5,
        chartRevenueData: chartRevenue,
        toCurrency: general.toCurrency,
    })
}

// [GET] /categories_admin/searchkey=?&page=?
dashboardController.getCategory = async (req, res) => {
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
    })
}

// [POST] /categories_admin/delete/:id
dashboardController.deleteCategory = async (req, res) => {

}

// [GET] /category
dashboardController.getOrders = async (req, res) => {
    const title = 'QUẢN LÝ ĐƠN HÀNG';
    const sql = 'SELECT * FROM view_dashboard';
    res.render('admin/pages/orders_admin', {
        title
    })
}

module.exports = dashboardController
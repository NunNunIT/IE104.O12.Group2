const cate = require ('../../models/admin/cateAdmin.model') 

const cateAdminController = () => { }

// [GET] /categories_admin/searchkey=?&page=?
cateAdminController.getCategories = async (req, res) =>{
    const title = 'QUẢN LÝ DANH MỤC SẢN PHẨM'
    // lấy từ khóa searchKey=?
    let admin = req.admin
    let searchKey = req.query.searchKey
    let page = req.query.page ? req.query.page : 1
    let limit = 10

    let categories = await cate.getCategories(searchKey, page, limit)
    console.log(categories)
    res.status(200).render('admin/pages/cate_admin',{
        title: title,
        admin: admin,
        data: categories,
    })
}

// [POST] /categories_admin/delete/:id
cateAdminController.deleteCategory = async (req, res) =>{

}


// [GET] /category
cateAdminController.getOrders = async (req, res) =>{
    const title = 'QUẢN LÝ ĐƠN HÀNG';
    const sql = 'SELECT * FROM view_dashboard';
    res.render('admin/pages/orders_admin', {
        title
    })
}

module.exports = cateAdminController
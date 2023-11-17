//ket noi db
const db =  require('../config/db/connect');

const test = function (){};

test.getDetail = function(req, res, callback){
    const testsql = 'SELECT * FROM view_test WHERE product_id = ?'

// lay ID tren duong dan
const params = [req.params.productId]

    db.query(testsql, [params], function(err, results){
      callback(err, results)
    })
}

module.exports = test
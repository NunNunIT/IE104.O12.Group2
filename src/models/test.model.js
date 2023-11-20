const db = require('../config/db/connect')

const test = function () { }

test.getDetail = function (req, res, callback) {
    const testSql = 'SELECT * FROM view_test WHERE product_id = ?'

    const params = [req.params.productId]

    db.query(testSql, [params], function (err, results) {
        // req.send({results})
        callback(err, results)
    })
}

module.exports = test

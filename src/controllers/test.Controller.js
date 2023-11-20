const test = require('../models/test.model');

class testController {

    // [GET] /search/results
    detail(req, res) {
        test.getDetail(req, res, function (err, result) {
            // res.send({result})
            res.status(200).render('./pages/search/detail', {
                data_product: result,
            })
        })
    }

}

module.exports = new testController()
class SiteController {
    // [GET] /
    index(req, res) {
        res.send('trang chu')
    }
}

module.exports = new SiteController()
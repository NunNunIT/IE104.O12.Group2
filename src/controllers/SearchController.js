class SearchController {

    // [GET] /search/results
    results(req, res) {
        const searchResults = {
            name: 'HaiYen',
            rate: '4',
        }
        res.render('./pages/search/results', { searchResults })
    }

    // [GET] /search/:productId
    detail(req, res) {
        res.render('./pages/search/detail')
    }

}

module.exports = new SearchController()
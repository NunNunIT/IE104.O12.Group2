class SearchController {

    // [GET] /search/results
    results(req, res) {
        const searchResults = {
            name: 'HaiYen',
            rate: '4',
        }
        res.render('./pages/search/results', {
            user: (req.user)? req.user : 0,
            searchResults
        })
    }

    // [GET] /search/:productId
    detail(req, res) {
        res.render('./pages/search/detail', {
            user: (req.user)? req.user : 0
        })
    }

}

module.exports = new SearchController()
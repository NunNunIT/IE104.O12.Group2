const db = require('../config/db/connect')
const jwt = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const { promisify } = require('util')

class SiteController {

	// [GET] /
	index(req, res) {
		const productCatalog = {
			cooker: 'Nồi cơm điện',
			fan: 'Quạt điện',
			fridge: 'Tủ lạnh',
			television: 'Ti vi',
			'water-purifier': 'Máy lọc nước',
			'induction-cooker': 'Bếp từ',
		}

		res.render('./pages/site/index', { productCatalog })
	}

}

module.exports = new SiteController()
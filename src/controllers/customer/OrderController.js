const {promisify} = require('util')

// Tất cả controller dều khai báo cái này
const index = require('../../models/customer/index.model')

const orderController = () => { }

// [GET] /order/cart
orderController.cart = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)
	let detailCart = await index.getDetailCart(req)

	res.render('./pages/order/cart', {
		header: header,
		user: header_user,
		detailCart: detailCart,
	})
}

// [GET] /order/information
orderController.information = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)

	res.render('./pages/order/information', {
		header: header,
		user: header_user,
	})
}

// [POST] /order/information
orderController.informationPost = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)

	res.render('./pages/order/information', {
		header: header,
		user: header_user,
	})
}

// [GET] /order/transaction
orderController.transaction = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)

	const title = 'Thanh toán'

	res.render('./pages/order/transaction', {
		header: header,
		user: header_user,
		title,
	})
}

// [GET] /order/atm
orderController.atm = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)

	const title = 'Thanh toán ATM'

	res.render('./pages/order/atm', {
		header: header,
		user: header_user,
		title,
	})
}

// [GET] /order/momo
orderController.momo = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)

	const title = 'Thanh toán MoMo'

	res.render('./pages/order/momo', {
		header: header,
		user: header_user,
		title,
	})
}

// [GET] /order/credit
orderController.credit = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)

	const title = 'Thanh toán Tín dụng'

	res.render('./pages/order/credit', {
		header: header,
		user: header_user,
		title,
	})
}

// [GET] /order/warranty
orderController.warranty = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)

	const title = 'Bảo hành sản phẩm'

	res.render('./pages/order/warranty', {
		header: header,
		user: header_user,
		title,
	})
}

module.exports = orderController


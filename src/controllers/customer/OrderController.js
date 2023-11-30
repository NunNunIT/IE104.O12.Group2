const { promisify } = require('util')
const index = require('../../models/customer/index.model')
const order = require('../../models/customer/order.model')
const general = require('../../models/general.model')

const orderController = () => { }

orderController.addCart = async (req, res) => {
	let customer_id = req.user.customer_id
	let product_variant_id = req.body.product_variant_id
	let cart_quantity = req.body.cart_quantity

	let result = await order.addCart(customer_id, product_variant_id, cart_quantity)

	if (result) {
		return res.json({
			status: 'success',
		})
	} else {
		return res.json({
			status: 'error',
		})
	}
}

// [GET] /order/cart
orderController.cart = async (req, res) => {
	customer_id = req.user.customer_id
	let header_user = await index.header_user(req)
	let header = await index.header(req)
	let detailCart = await order.getDetailCart(customer_id)

	res.render('./pages/order/cart', {
		header: header,
		user: header_user,
		detailCart: detailCart,
		toCurrency: general.toCurrency,
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
	console.log(req.body.product_variant_id)
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


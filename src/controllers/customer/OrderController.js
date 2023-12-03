const { promisify } = require('util')
const index = require('../../models/customer/index.model')
const order = require('../../models/customer/order.model')
const general = require('../../models/general.model')
const account = require('../../models/customer/account.model')

const orderController = () => { }

// [POST] /order/addCart
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
	let formatFunction = await general.formatFunction()

	res.render('./pages/order/cart', {
		header: header,
		user: header_user,
		detailCart: detailCart,
		formatFunction: formatFunction,
	})
}

// [POST] /order/cart/delete
orderController.deleteCart = async (req, res) => {
	let customer_id = req.user.customer_id
	console.log(req.body)
	let productsDeleteCart = req.body

	order.deleteCart(customer_id, productsCartDelete, function (err, success) {
		if (success) {
			return res.status(200).json({
				status: 'success',
			})
		} else {
			return res.status(404).json({
				status: 'error',
			})
		}
	})
}

// [GET] /order/information
orderController.information = async (req, res) => {
	let header_user = await index.header_user(req)
	let header = await index.header(req)
	let formatFunction = await general.formatFunction()

	res.render('./pages/order/information', {
		header: header,
		user: header_user,
		formatFunction: formatFunction,
	})
}

// [POST] /order/information
orderController.informationPost = async (req, res) => {
	let orderInformation = req.body
	console.log('Nhung cần', orderInformation)

	let customer_id = req.user.customer_id
	let orderInfo = orderInformation.orderInfo
	let orderDetails = orderInformation.orderDetails

	order.insertOrder(customer_id, orderInfo, orderDetails, function (err, success, order_id, paying_method_id) {
		if (err) {
			return res.status(404).json({
				status: 'error',
			})
		} else if (success) {
			order.deleteCart(customer_id, orderDetails, function (err, success) { })
			res.status(200).json ({
				status: 'success',
				order_id: order_id,
				paying_method_id: orderInfo.paying_method_id,
			})
		}
	})
}

// [GET] /order/payment?paying_method_id=x&order_id=y

orderController.payment = async (req, res) => {
	let paying_method_id = req.query.paying_method_id
	let order_id = req.query.order_id

	console.log(paying_method_id, order_id)

	let customer_id = req.user.customer_id
	let header_user = await index.header_user(req)
	let header = await index.header(req)
	let formatFunction = await general.formatFunction()

	let purchase = await account.getPurchaseHistory(customer_id, 0, order_id)

	if (paying_method_id == 1) {
		res.render('./pages/order/atm', {
			header: header,
			user: header_user,
			formatFunction: formatFunction,
			purchase: purchase,
		})
	} else if (paying_method_id == 2) {
		res.render('./pages/order/atm', {
			header: header,
			user: header_user,
			formatFunction: formatFunction,
			purchase: purchase,
		})
	} else {
		res.render('./pages/order/momo', {
			header: header,
			user: header_user,
			formatFunction: formatFunction,
			purchase: purchase,
		})
	}
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


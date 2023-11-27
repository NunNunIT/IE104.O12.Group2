const index = require('../../models/customer/index.model')

const orderController = () => { }

// [GET] /order/cart
orderController.cart = async (req, res) => {
	res.render('./pages/order/cart', {
		user: (req.user) ? req.user : 0
	})
}

// [GET] /order/information
orderController.information = async (req, res) => {
	res.render("./pages/order/information", {
		user: (req.user) ? req.user : 0
	})
}

// [GET] /order/transaction
orderController.transaction = async (req, res) => {
	const title = "Thanh toán"
	res.render("./pages/order/transaction", {
		user: (req.user) ? req.user : 0
	})
}

// [GET] /order/atm
orderController.atm = async (req, res) => {
	const title = "Thanh toán ATM"
	res.render("./pages/order/atm", {
		user: (req.user) ? req.user : 0
	})
}

// [GET] /order/momo
orderController.momo = async (req, res) => {
	const title = "Thanh toán MoMo"
	res.render("./pages/order/momo", {
		user: (req.user) ? req.user : 0
	})
}

// [GET] /order/credit
orderController.credit = async (req, res) => {
	const title = "Thanh toán Tín dụng"
	res.render("./pages/order/credit", {
		user: (req.user) ? req.user : 0
	})
}

// [GET] /order/warranty
orderController.warranty = async (req, res) => {
	const title = "Bảo hành sản phẩm"
	res.render("./pages/order/warranty")
}

module.exports = orderController

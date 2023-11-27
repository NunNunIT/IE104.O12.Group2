const {promisify} = require('util')

// Tất cả controller dều khai báo cái này
const index = require('../../models/customer/index.model')

const orderController = () => { }

	// [GET] /order/cart
	orderController.cart = async (req, res) => {
		let header = await index.header(req)
    	let header_user = await index.header_user(req)

		res.render('./pages/order/cart', {
			header: header,
        	user: header_user,
		})
	}

	// [POST] /order/information
	orderController.information = async (req, res) => {
		let header = await index.header(req)
    	let header_user = await index.header_user(req)

		res.render("./pages/order/information", {
			header: header,
        	user: header_user,
		});
	}

	// [GET] /order/transaction
	orderController.transaction = async (req, res) => {
		const title = "Thanh toán";
		let header = await index.header(req)
    	let header_user = await index.header_user(req)

		res.render("./pages/order/transaction", {
			header: header,
        	user: header_user,
		});
	}

	// [GET] /order/atm
	orderController.atm = async (req, res) => {
		const title = "Thanh toán ATM";
		let header = await index.header(req)
    	let header_user = await index.header_user(req)

		res.render("./pages/order/atm", {
			header: header,
        	user: header_user,
		});
	}

	// [GET] /order/momo
	orderController.momo = async (req, res) => {
		const title = "Thanh toán MoMo";
		let header = await index.header(req)
    	let header_user = await index.header_user(req)

		res.render("./pages/order/momo", {
			header: header,
        	user: header_user,
		});
	}

	// [GET] /order/credit
	orderController.credit = async (req, res) => {
		const title = "Thanh toán Tín dụng";
		let header = await index.header(req)
    	let header_user = await index.header_user(req)

		res.render("./pages/order/credit", {
			header: header,
        	user: header_user,
		});
	}


module.exports = orderController


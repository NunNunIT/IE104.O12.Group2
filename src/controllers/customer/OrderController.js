class OrderController {

	// [GET] /order/cart
	cart(req, res) {
		res.render('./pages/order/cart', {
			user: (req.user) ? req.user : 0
		})
	}

	// [GET] /order/information
	information(req, res) {
		res.render("./pages/order/information", {
			user: (req.user) ? req.user : 0
		});
	}

	// [GET] /order/transaction
	transaction(req, res) {
		const title = "Thanh toán";
		res.render("./pages/order/transaction", {
			user: (req.user) ? req.user : 0
		});
	}

	// [GET] /order/atm
	atm(req, res) {
		const title = "Thanh toán ATM";
		res.render("./pages/order/atm", {
			user: (req.user) ? req.user : 0
		});
	}

	// [GET] /order/momo
	momo(req, res) {
		const title = "Thanh toán MoMo";
		res.render("./pages/order/momo", {
			user: (req.user) ? req.user : 0
		});
	}

	// [GET] /order/credit
	credit(req, res) {
		const title = "Thanh toán Tín dụng";
		res.render("./pages/order/credit", {
			user: (req.user) ? req.user : 0
		});
	}

	// [GET] /order/warranty
	warranty(req, res) {
		const title = "Bảo hành sản phẩm";
		res.render("./pages/order/warranty");
	}
}

module.exports = new OrderController();

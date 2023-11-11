class SiteController {
  // [GET] /
  index(req, res) {
    const productCatalog = {
      cooker: "Nồi cơm điện",
      fan: "Quạt điện",
      fridge: "Tủ lạnh",
      television: "Ti vi",
      "water-purifier": "Máy lọc nước",
      "induction-cooker": "Bếp từ",
    };

    res.render("./pages/index", { productCatalog });
  }

  search(req, res) {
    const searchResults = {
      name: "HaiYen",
      rate: "4",
    };
    res.render("./pages/search-results", { searchResults });
  }

  productDetail(req, res) {
    const title = "Chi tiết sản phẩm";
    res.render("./pages/product-detail", { title });
  }

  forgotPassword(req, res) {
    const title = "Quên mật khẩu";
    res.render("./pages/forgot-password", { title });
  }

  resetPassword(req, res) {
    const title = "Đặt lại mật khẩu";
    res.render("./pages/reset-password", { title });
  }

  transaction(req, res) {
    const title = "Thanh toán";
    res.render("./pages/transaction", { title });
  }

  momo(req, res) {
    const title = "Thanh toán MoMo";
    res.render("./pages/momo", { title });
  }

  atm(req, res) {
    const title = "Thanh toán ATM";
    res.render("./pages/atm", { title });
  }

  credit(req, res) {
    const title = "Thanh toán Tín dụng";
    res.render("./pages/credit", { title });
  }
}

module.exports = new SiteController();

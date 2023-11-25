class AccountController {
  // [GET] /account/information
  information(rea, res) {
    res.render("./pages/account/information");
  }

  // [GET] /account/pruchase-history
  purchaseHistory(req, res) {
    res.render("./pages/account/purchase-history");
  }

  // [GET] /account/pruchase-history
  purchaseDetail(req, res) {
    res.render("./pages/account/purchase-detail");
  }

  // [GET] /account/feedback
  feedback(req, res) {
    res.render("./pages/account/feedback");
  }

  warrantyClaim(req, res) {
    res.render("./pages/account/warranty-claim");
  }

  changePassword(req, res) {
    res.render("./pages/account/changePassword");
  }

  checkUser(req, res) {
    auth.checkPassword(req, function (err, wrong, success) {
      if (err) {
        return res.json({
          status: "error",
          error: "Lỗi truy cập.",
        });
      } else if (wrong) {
        return res.json({
          status: "wrongPassword",
          error: "Mật khẩu không chính xác!",
        });
      } else if (success) {
        return res.json({
          status: "success",
          error: "Thành công.",
        });
      }
    });
  }
}

module.exports = new AccountController();

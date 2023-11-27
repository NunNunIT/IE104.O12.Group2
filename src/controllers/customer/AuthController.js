const {
  json
} = require("express");
const db = require("../../config/db/connect");
const auth = require("../../models/customer/auth.model");
const jwt = require("jsonwebtoken");
const {
  promisify
} = require("util");
class AuthController {
  // [GET] auth/register
  register(req, res) {
    res.render("./pages/auth/register");
  }

  // [POST] auth/register
  submitRegister(req, res) {
    auth.registerPost(req, function (error, dupPhoneNumber, success) {
      if (error) res.render("./pages/site/404-error");
      if (dupPhoneNumber)
        return res.json({
          status: "error",
          error: "Số điện thoại đã được sử dụng",
        });

      if (success)
        return res.json({
          status: "success",
          success: "Register successfully",
        });
    });
  }

  // [GET] /login
  login(req, res) {
    res.render("./pages/auth/login");
  }

  // [POST] /login
  submitLogin(req, res) {
    auth.loginPost(req, function (err, nonePhoneNumber, NotMatchPassword, success, id) {
      if (err) res.render("./pages/site/404-error");
      if (nonePhoneNumber) {
        return res.json({
          status: "error",
          error: "Số điện thoại không tồn tại.",
        });
      }

      if (NotMatchPassword) {
        return res.json({
          status: "error2",
          error: "Mật khẩu không chính xác.",
        });
      }

      if (success) {
        const token = jwt.sign({
            id,
          },
          process.env.JWT_SECRET, {
            expiresIn: process.env.JWT_EXPIRES,
          }
        );

        console.log("the token is " + token);

        const cookieOptions = {
          expires: new Date(
            Date.now() + process.env.JWT_COOKIE_EXPIRES * 24 * 60 * 1000
          ),
          httpOnly: true,
        };
        res.cookie("userSave", token, cookieOptions);
        res.json({
          status: "success",
          success: "Bạn đã đăng nhập thành công",
        });
      }
    });
  }

  logout = (req, res) => {
    res.cookie("userSave", "logout", {
      expires: new Date(Date.now() + 2 * 1000),
      httpOnly: true,
    });
    res.status(200).redirect("/");
  };

  forgotPassword(req, res) {
    const title = "Quên mật khẩu";
    res.render("./pages/auth/forgot", {
      title,
    });
  }

  findUser(req, res) {
    auth.findNumberPhone(req, function (err, notFound, success, user_id) {
      if (err) {
        return res.json({
          status: "error",
          error: "Lỗi truy cập.",
        });
      } else if (notFound) {
        return res.json({
          status: "notFound",
          error: "Số điện thoại không tồn tại.",
        });
      } else if (success) {
        return res.json({
          status: "success",
          error: "Thành công.",
          user_id: user_id
        })
      }

    });
  }

  

  resetPassword(req, res) {
    const title = "Đặt lại mật khẩu";
    res.render("./pages/auth/reset", {
      title,
    });
  }
}

module.exports = new AuthController();
const express = require("express");
const router = express.Router();

// import controller
const OrderController = require("../controllers/OrderController");

router.get("/cart", OrderController.cart);
router.get("/information", OrderController.information);
router.get("/transaction", OrderController.transaction);
router.get("/momo", OrderController.momo);
router.get("/atm", OrderController.atm);
router.get("/credit", OrderController.credit);
router.get("/warranty", OrderController.warranty);

module.exports = router;

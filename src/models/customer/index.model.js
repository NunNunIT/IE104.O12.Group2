const general = require('../../models/general.model')
const product = require('../../models/customer/product.model')
const db = require('../../config/db/connect');
const util = require('node:util')
const jwt = require('jsonwebtoken')
const query = util.promisify(db.query).bind(db)


const index = async function () { }

index.getCountCart = async (customer_id) => {
    let getCountCart = `SELECT * FROM view_count_cart WHERE user_id = ${customer_id}`;

    return new Promise((resolve, reject) => {
        db.query(getCountCart, (err, countCart) => {
            if (err) {
                console.log(err);
                resolve(0);
            } else {
                resolve(countCart[0].count_cart);
            }
        });
    });
};

index.getShortCart = async (customer_id) => {
    let getShortCart = `SELECT * FROM view_cart WHERE customer_id = ${customer_id}`;
    let shortCart = await query(getShortCart)

    shortCart = await general.productCurrencyFormat(shortCart)
    return(shortCart);
};

index.header_user = async (req) => {
    if (req.user) {
        let user = req.user
        let countCart = await index.getCountCart(req.user.customer_id)
        let shortCarts = await index.getShortCart(req.user.customer_id)
        let headers = {
            user,
            countCart,
            shortCarts
        }
        return (headers);
    } else {
        return 0
    }
}

index.header = async (req) => {
    let searchKey = req.query.searchKey ?? ''
    let cates = await general.getCates(req)
    let header = {
        searchKey,
        cates
    }
    return (header)
}

module.exports = index
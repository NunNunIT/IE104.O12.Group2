const db = require('../../config/db/connect');
const util = require('node:util')
const query = util.promisify(db.query).bind(db)

const indexAdmin = function () { }

indexAdmin.toCurrency = function (money) {
    let currency = money.toFixed(0).replace(/./g, function (c, i, a) {
        return i > 0 && c !== "," && (a.length - i) % 3 === 0 ? "." + c : c;
    });
    return currency;
}

module.exports = indexAdmin
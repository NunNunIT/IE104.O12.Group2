const db = require('../../config/db/connect');
const util = require('node:util')
const query = util.promisify(db.query).bind(db)
const general = require('../general.model');
const indexAdmin = require('./indexAdmin.model');

const dashboard = function(){}

dashboard.getSummary = async (req, res) => {
    let getSummary = `SELECT * FROM view_dashboard`
    let summary = await query(getSummary)
    summary[0].revenue = await indexAdmin.toCurrency(Number(summary[0].revenue))
    return summary[0]
}

module.exports = dashboard
const db = require('../../config/db/connect');
const util = require('node:util')
const query = util.promisify(db.query).bind(db)
const general = require('../general.model');
const indexAdmin = require('./indexAdmin.model');

const dashboard = function () { }

dashboard.getSummary = async (req, res) => {
    let getSummary = `SELECT * FROM view_dashboard`
    let summary = await query(getSummary)
    summary[0].revenue = await indexAdmin.toCurrency(Number(summary[0].revenue))
    return summary[0]
}

dashboard.getChartTop5 = async (req, res) => {
    let getChartTop5 = `SELECT * FROM view_getchart_top5_product`

    let chartTop5 = await query(getChartTop5)
    return chartTop5
}

dashboard.getChartRevenue = async (req, res) => {
    let getChartRevenue = `SELECT * FROM view_getchart_revenue`

    let chartRevenue = await query(getChartRevenue)
    return chartRevenue
}

module.exports = dashboard
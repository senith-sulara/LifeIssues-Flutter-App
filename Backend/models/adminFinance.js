const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let adminFinance = new Schema({
    title: {type: String},
    monthlyIncome: {type: String}
},
{
    timestamps: true
}
);

module.exports = mongoose.model("adminFinance", adminFinance);
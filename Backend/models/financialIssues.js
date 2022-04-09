const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let financialIssues = new Schema({
    monthlyIncome: {type: String},
    monthlyExpenditure: {type : String},
    bankLoanInstallment: {type : String},
    loanDuration: {type : String}
},
{
    timestamps: true
}
);

module.exports = mongoose.model("financialIssues", financialIssues);
const path = require('path');
const express = require('express');
const FinancialIssues = require('../models/financialIssues');

const Router = express.Router();

//Insert

Router.post(
    '/addFinancialIssues', 
    async (req, res) => {
        try {
            let financialIssue = new FinancialIssues({
                monthlyIncome: req.body.monthlyIncome,
                monthlyExpenditure: req.body.monthlyExpenditure,
                bankLoanInstallment: req.body.bankLoanInstallment,
                loanDuration: req.body.loanDuration
            });
            await financialIssue.save();
            res.send('Financial details uploaded!');
        } catch (error) {
            res.status(400).send('Error!!')
        }
    },
    (error, req, res, next) => {
        if (error) {
            res.status(500).send(error.message);
        }
    }
);


//get
Router.get('/getFinancialIssues', async (req, res) => {
    try {
        const records = await FinancialIssues.find({});
        const sortedByDate = records.sort(
            (a, b) => b.createdAt - a.createdAt
        );
        res.send(sortedByDate);
    } catch (error) {
        res.status(400).send('Error!!');
    }
});

//update
Router.put("/:id", async (req, res) => {
    try {
        let financeIssue = await FinancialIssues.findById(req.params.id);
        const data = {
            monthlyIncome: req.body.monthlyIncome || financeIssue.monthlyIncome,
            monthlyExpenditure: req.body.monthlyExpenditure || financeIssue.monthlyExpenditure,
            bankLoanInstallment: req.body.bankLoanInstallment || financeIssue.bankLoanInstallment,
            loanDuration: req.body.loanDuration || financeIssue.loanDuration
        };
        financeIssue = await FinancialIssues.findByIdAndUpdate(req.params.id, data, { new: true });
        res.json(financeIssue);
    } catch (e) {
        res.status(400).json({ msg: e.message, success: false});
    }
});

//delete
Router.delete('/:id', async (req, res) => {
    try {
        const financeIssue = await FinancialIssues.findById(req.params.id);
        if (!financeIssue) 
            throw Error('Does not exist!!');
        const remove = await financeIssue.remove();
        if (!remove) 
            throw Error('Something went wrong');
        res.json(financeIssue);
    } catch (e) {
        res.status(400).json({msg: e.message, success: false});
    }
});

module.exports = Router;
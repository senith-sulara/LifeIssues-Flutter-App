const path = require('path');
const express = require('express');
const AdminFinanceIssue = require('../models/adminFinance');

const Router = express.Router();

//Insert

Router.post(
    '/addIssues', 
    async (req, res) => {
        try {
            let adminIssues = new AdminFinanceIssue({
                title: req.body.title,
                monthlyIncome: req.body.monthlyIncome,
            });
            await adminIssues.save();
            res.send('Financial Issue uploaded!');
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
Router.get('/getAdminIssue', async (req, res) => {
    try {
        const records = await AdminFinanceIssue.find({});
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
        let adminIssues = await AdminFinanceIssue.findById(req.params.id);
        const data = {
            title: req.body.title || adminIssues.title,
            monthlyIncome: req.body.monthlyIncome || adminIssues.monthlyIncome
        };
        adminIssues = await AdminFinanceIssue.findByIdAndUpdate(req.params.id, data, { new: true });
        res.json(adminIssues);
    } catch (e) {
        res.status(400).json({ msg: e.message, success: false});
    }
});

//delete
Router.delete('/:id', async (req, res) => {
    try {
        const adminIssues = await AdminFinanceIssue.findById(req.params.id);
        if (!adminIssues) 
            throw Error('Does not exist!!');
        const remove = await adminIssues.remove();
        if (!remove) 
            throw Error('Something went wrong');
        res.json(adminIssues);
    } catch (e) {
        res.status(400).json({msg: e.message, success: false});
    }
});

module.exports = Router;
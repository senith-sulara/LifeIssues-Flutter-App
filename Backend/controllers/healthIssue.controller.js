const path = require('path');
const express = require('express');
const Issues = require('../models/healthIssue');
const Router = express.Router();
const User = require('../models/userHealth')

//Insert

Router.post(
    '/insert',
    async (req, res) => {
        try {
            let issue = new Issues({
                title: req.body.title,
                imageUrl: req.body.imageUrl,
                gender: req.body.gender,
                ageRange: req.body.ageRange,
                waterIntakeRange: req.body.waterIntakeRange,
                workoutRange: req.body.workoutRange,
            });
            await issue.save();
            res.send('Health Issue details uploaded successfully.');
        } catch (error) {
            res.status(400).send('Error while uploading Issues. Try again later.');
        }
    },
    (error, req, res, next) => {
        if (error) {
            res.status(500).send(error.message);
        }
    }
);

// get Health Issue details
Router.get('/getAllHealthIssues', async (req, res) => {
    try {
        const files = await Issues.find({});
        const sortedByCreationDate = files.sort(
            (a, b) => b.createdAt - a.createdAt
        );
        res.send(sortedByCreationDate);
    } catch (error) {
        res.status(400).send('Error while getting list of Issues. Try again later.');
    }
});


// get health issue details by age, gender, workout hours per week and water consumption
Router.get('/getIssuesaby', async (req, res) => {
    try {
        const userData = await User.findOne({}).sort({ _id: -1 }).limit(1);
        if (userData.ageRange == '20-30' && userData.waterIntakeRange == '0.5L-1L' && userData.gender == 'Male' && userData.workoutRange == '0-1Hrs') {
            const files = await Issues.find({ ageRange: '20-30', gender: 'Male', waterIntakeRange: '0.5L-1L', workoutRange: '0-1Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        } else if (userData.ageRange == '20-30' && userData.waterIntakeRange == '0.5L-1L' && userData.gender == 'Male' && userData.workoutRange == '0-1Hrs') {
            const files = await Issues.find({ ageRange: '20-30', gender: 'Male', waterIntakeRange: '0.5L-1L', workoutRange: '0-1Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }else if (userData.ageRange == '20-30' && userData.waterIntakeRange == '0.5L-1L' && userData.gender == 'Female' && userData.workoutRange == '0-1Hrs') {
            const files = await Issues.find({ ageRange: '20-30', gender: 'Female', waterIntakeRange: '0.5L-1L', workoutRange: '0-1Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }else if (userData.ageRange == '30-40' && userData.waterIntakeRange == '0.5L-1L' && userData.gender == 'Male' && userData.workoutRange == '0-1Hrs') {
            const files = await Issues.find({ ageRange: '30-40', gender: 'Male', waterIntakeRange: '0.5L-1L', workoutRange: '0-1Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }else if (userData.ageRange == '30-40' && userData.waterIntakeRange == '0.5L-1L' && userData.gender == 'Male' && userData.workoutRange == '3-5Hrs') {
            const files = await Issues.find({ ageRange: '30-40', gender: 'Male', waterIntakeRange: '0.5L-1L', workoutRange: '3-5Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }else if (userData.ageRange == '40-60' && userData.waterIntakeRange == '0.5L-1L' && userData.gender == 'Male' && userData.workoutRange == '3-5Hrs') {
            const files = await Issues.find({ ageRange: '40-60', gender: 'Male', waterIntakeRange: '0.5L-1L', workoutRange: '3-5Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }else if (userData.ageRange == '40-60' && userData.waterIntakeRange == '1L-3L' && userData.gender == 'Male' && userData.workoutRange == '3-5Hrs') {
            const files = await Issues.find({ ageRange: '40-60', gender: 'Male', waterIntakeRange: '1L-3L', workoutRange: '3-5Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }else if (userData.ageRange == '40-60' && userData.waterIntakeRange == '1L-3L' && userData.gender == 'Female' && userData.workoutRange == '3-5Hrs') {
            const files = await Issues.find({ ageRange: '40-60', gender: 'Female', waterIntakeRange: '1L-3L', workoutRange: '3-5Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }else if (userData.ageRange == '40-60' && userData.waterIntakeRange == '1L-3L' && userData.gender == 'Male' && userData.workoutRange == '3-5Hrs') {
            const files = await Issues.find({ ageRange: '40-60', gender: 'Male', waterIntakeRange: '1L-3L', workoutRange: '3-5Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }else if (userData.ageRange == '20-30' && userData.waterIntakeRange == '1L-3L' && userData.gender == 'Male' && userData.workoutRange == '3-5Hrs') {
            const files = await Issues.find({ ageRange: '20-30', gender: 'Male', waterIntakeRange: '1L-3L', workoutRange: '3-5Hrs' });
            const sortedByCreationDate = files.sort(
                (a, b) => b.createdAt - a.createdAt
            );
            res.send(sortedByCreationDate);
        }
    } catch (error) {
        res.status(400).send('Error while getting list of Issues. Try again later.');
    }
});


//Update health issue details
Router.put("/:id", async (req, res) => {
    try {
        let issue = await Issues.findById(req.params.id);
        // Delete image from cloudinary
        const data = {
            title: req.body.title || issue.title,
            imageUrl: req.body.imageUrl || issue.imageUrl,
            gender: req.body.gender || issue.gender,
            age: req.body.age || issue.age,
            waterIntakeRange: req.body.waterIntakeRange || issue.waterIntakeRang,
            workoutRange: req.body.workoutRange || issue.workoutRange,
        };
        issue = await Issues.findByIdAndUpdate(req.params.id, data, { new: true });
        res.json(issue);
    } catch (e) {
        res.status(400).json({ msg: e.message, success: false });
    }
});



//Delete health issue details
Router.delete("/:id", async (req, res) => {
    try {
        // Find issue by id
        const issue = await Issues.findById(req.params.id);
        if (!issue) throw Error('No file found');
        const removed = await issue.remove();
        if (!removed)
            throw Error('Something went wrong while trying to delete the file');
        res.json(issue);
    } catch (e) {
        res.status(400).json({ msg: e.message, success: false });
    }
});


module.exports = Router;
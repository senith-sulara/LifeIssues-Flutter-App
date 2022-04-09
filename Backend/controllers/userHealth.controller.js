const express = require('express');
const UserHealth = require('../models/userHealth');
const Router = express.Router();

//User insert there health details

Router.post(
    '/insert',
    async (req, res) => {
        try {
            let userHealth = new UserHealth({
                name: req.body.name,
                ageRange: req.body.ageRange,
                gender: req.body.gender,
                workoutRange: req.body.workoutRange,
                waterIntakeRange: req.body.waterIntakeRange,
            });
            await userHealth.save();
            res.send('Health details uploaded successfully');
        } catch (error) {
            res.status(400).send('Error,Try again later');
        }
    },
    (error, req, res, next) => {
        if (error) {
            res.status(500).send(error.message);
        }
    }
);


Router.get('/getAllUsersByHealth', async (req, res) => {
    try {
        const files = await UserHealth.find({}).sort({ _id: -1 }).limit(1);
        const sortedByCreationDate = files.sort(
            (a, b) => b.createdAt - a.createdAt
        );
        res.send(sortedByCreationDate);
    } catch (error) {
        res.status(400).send('Error while getting list of Users. Try again later.');
    }
});

//Delete

Router.delete("/:id", async (req, res) => {
    try {
        // Find userHealth by id
        const userHealth = await UserHealth.findById(req.params.id);
        if (!userHealth) throw Error('No file found');
        // Delete userHealth from db
        const removed = await userHealth.remove();
        if (!removed)
            throw Error('Something went wrong while trying to delete the file');
        res.json(userHealth);
    } catch (e) {
        res.status(400).json({ msg: e.message, success: false });
    }
});

module.exports = Router;
const express = require('express');
const UserFamily = require('../models/userFamily');
const Router = express.Router();


//Insert

Router.post(
  '/insert',
    async (req, res) => {
      try {
        let userfamily = new UserFamily({
            name: req.body.name,  
            gender: req.body.gender, 
            age: req.body.age,
            job: req.body.job, 
            civilstatus: req.body.civilstatus,
        });
      await userfamily.save();
      res.send('User details uploaded successfully.');
      } catch (error) {
        res.status(400).send('Error while uploading User details. Try again later.');
      }
    },
    (error, req, res, next) => {
      if (error) {
        res.status(500).send(error.message);
      }
    }
);

Router.get('/getAllUsers', async (req, res) => {
  try {
    const files = await UserFamily.find({});
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
    // Find userfamily by id
    const userfamily = await UserFamily.findById(req.params.id);
    if (!userfamily) throw Error('No file found');
    // Delete userfamily from db
    const removed = await userfamily.remove();
    if (!removed)
         throw Error('Something went wrong while trying to delete the file');
    res.json(userfamily);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

module.exports = Router;
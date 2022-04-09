const path = require('path');
const express = require('express');
const Issues = require('../models/familyissues');
const User = require('../models/userFamily');

const Router = express.Router();


//Insert

Router.post(
  '/insert',
    async (req, res) => {
      try {
        let issue = new Issues({
          title: req.body.title,  
          imageUrl: req.body.imageUrl, 
          gender: req.body.gender,
          civilstatus: req.body.civilstatus, 
          age: req.body.age,
        });
      await issue.save();
      res.send('Issue details uploaded successfully.');
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

//////////////////////////////////////////
// get issue details

Router.get('/getAllIssues', async (req, res) => {
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

// get issue details by age and gender
// find({}, {age:1, _id:0}).sort({_id:1}).limit(1)

Router.get('/getIssuesaby', async (req, res) => {
  try {
    const userData = await User.findOne({}).sort( { _id : -1 } ).limit(1);
    if(userData.age >= 18 && userData.age < 24 && userData.gender == 'Male' && userData.civilstatus == 'Unmarried'){
    const files = await Issues.find({age: {$gt:17, $lt:24}});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 18 && userData.age < 24 && userData.gender == 'Male' && userData.civilstatus == 'Married'){
    const files = await Issues.find({age: {$gt:17, $lt:24}});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }
  else if(userData.age >= 18 && userData.age < 24 && userData.gender == 'Female'  && userData.civilstatus == 'Unmarried'){
    const files = await Issues.find({age: {$gt:17, $lt:24}});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 18 && userData.age < 24 && userData.gender == 'Female'  && userData.civilstatus == 'Married'){
    const files = await Issues.find({age: {$gt:17, $lt:24}});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  } else if(userData.age >= 18 && userData.age < 24 && userData.gender == 'Other'){
    const files = await Issues.find({age: {$gt:17, $lt:24}});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 24 && userData.age < 30 && userData.gender == 'Male'  && userData.civilstatus == 'Unmarried'){
    const files = await Issues.find({age: {$gt:23, $lt:30}, gender:'Male', civilstatus: 'Unmarried'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 24 && userData.age < 30 && userData.gender == 'Male'  && userData.civilstatus == 'Married'){
    const files = await Issues.find({age: {$gt:23, $lt:30}, gender:'Male', civilstatus: 'Married'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }
  else if(userData.age >= 24 && userData.age < 30 && userData.gender == 'Female' && userData.civilstatus == 'Unmarried'){
    const files = await Issues.find({age: {$gt:23, $lt:30}, gender:'Female', civilstatus: 'Unmarried'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }
  else if(userData.age >= 24 && userData.age < 30 && userData.gender == 'Female' && userData.civilstatus == 'Married'){
    const files = await Issues.find({age: {$gt:23, $lt:30}, gender:'Female', civilstatus: 'Married'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 24 && userData.age < 30 && userData.gender == 'Other'){
    const files = await Issues.find({age: {$gt:23, $lt:30}});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 30 && userData.age < 40 && userData.gender == 'Male' && userData.civilstatus == 'Unmarried'){
    const files = await Issues.find({age: {$gt:29, $lt:40}, gender:'Male', civilstatus: 'Unmarried'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 30 && userData.age < 40 && userData.gender == 'Male' && userData.civilstatus == 'Married'){
    const files = await Issues.find({age: {$gt:29, $lt:40}, gender:'Male', civilstatus: 'Married'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  } else if(userData.age >= 30 && userData.age < 40 && userData.gender == 'Female' && userData.civilstatus == 'Unmarried'){
    const files = await Issues.find({age: {$gt:29, $lt:40}, gender:'Female', civilstatus: 'Unmarried'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 30 && userData.age < 40 && userData.gender == 'Female' && userData.civilstatus == 'Married'){
    const files = await Issues.find({age: {$gt:29, $lt:40}, gender:'Female', civilstatus: 'Married'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  } else if(userData.age >= 30 && userData.age < 40 && userData.gender == 'Other'){
    const files = await Issues.find({age: {$gt:29, $lt:40}});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 40 && userData.age < 100 && userData.gender == 'Male' && userData.civilstatus == 'Unmarried'){
    const files = await Issues.find({age: {$gt:39, $lt:100},gender:'Male', civilstatus: 'Unmarried'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 40 && userData.age < 100 && userData.gender == 'Male' && userData.civilstatus == 'Married'){
    const files = await Issues.find({age: {$gt:39, $lt:100},gender:'Male', civilstatus: 'Married'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 40 && userData.age < 100 && userData.gender == 'Female'&& userData.civilstatus == 'Unmarried'){
    const files = await Issues.find({age: {$gt:39, $lt:100},gender:'Female', civilstatus: 'Unmarried'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 40 && userData.age < 100 && userData.gender == 'Female'&& userData.civilstatus == 'Married'){
    const files = await Issues.find({age: {$gt:39, $lt:100},gender:'Female', civilstatus: 'Married'});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else if(userData.age >= 40 && userData.age < 100 && userData.gender == 'Other'){
    const files = await Issues.find({age: {$gt:39, $lt:100}});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }else{
    const files = await Issues.find({});
    const sortedByCreationDate = files.sort(
      (a, b) => b.createdAt - a.createdAt
    );
    res.send(sortedByCreationDate);
  }
  } catch (error) {
    res.status(400).send('Error while getting list of Issues. Try again later.');
  }
});
////////////////////////////////////


//Update
Router.put("/:id", async (req, res) => {
  try {
    let issue = await Issues.findById(req.params.id);
    // Delete image from cloudinary
    const data = {
      title: req.body.title || issue.title,
      imageUrl: req.body.imageUrl || issue.imageUrl,
      gender: req.body.gender || issue.gender,
      civilstatus: req.body.civilstatus || issue.civilstatus,
      age: req.body.age || issue.age
    };
    issue = await Issues.findByIdAndUpdate(req.params.id, data, { new: true });
    res.json(issue);
  } catch (e) {
    res.status(400).json({ msg: e.message, success: false });
  }
});

//////////////////////////////////////

//Delete
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
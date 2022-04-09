const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let healthIssue = new Schema({
    title: {type: String},
    imageUrl: { type: String},
    gender: { type: String},
    ageRange: {type:String},
    waterIntakeRange:{type:String},
    workoutRange:{type:String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("healthIssue", healthIssue);
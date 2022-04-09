const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let socialssues = new Schema({
    title: {type: String},
    imageUrl: { type: String},
    gender: { type: String},
    civilstatus: { type: String},
    age: {type:String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("socialssues", socialssues);
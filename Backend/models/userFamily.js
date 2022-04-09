const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let UserFamily = new Schema({
    name: {type: String},
    gender: { type: String},
    age: { type: String},
    job: { type: String},
    civilstatus: { type: String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("usersfamily", UserFamily);
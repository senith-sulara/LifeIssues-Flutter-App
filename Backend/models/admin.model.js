const mongoose = require("mongoose");
const Schema = mongoose.Schema;

let Admin = new Schema({
    email: {type: String},
    password: { type: String},
  },
   { 
    timestamps: true 
   }
  );
  
  module.exports = mongoose.model("admin", Admin);
const mongoose =require("mongoose");
const { schema } = require("./userFamily");
const Schema = mongoose.Schema;

let UserHealth = new Schema({
    name : {type:String},
    ageRange : {type:String},
    gender : {type:String},
    workoutRange : {type:String},
    waterInakeRange : {type:String},
},
{
    timestamps:true
});

module.exports = mongoose.model("userHealth",UserHealth);
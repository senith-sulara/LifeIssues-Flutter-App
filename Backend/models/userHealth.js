const mongoose =require("mongoose");
const Schema = mongoose.Schema;

let UserHealth = new Schema({
    name : {type:String},
    ageRange : {type:String},
    gender : {type:String},
    workoutRange : {type:String},
    waterIntakeRange : {type:String},
},
{
    timestamps:true
});

module.exports = mongoose.model("userHealth",UserHealth);
const express = require('express')
const Admin = require('../models/admin.model')
const router = express.Router()
const jwt = require("jsonwebtoken");
const config = require('../utils/config')

router.post('/signup',(req,res)=>{
    Admin.findOne({email:req.body.email},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user==null){
                const user = Admin({
                    email:req.body.email,
                    password:req.body.password
                })
                user.save()
                .then((err)=>{
                    if(err){
                        console.log(err)
                        res.json(err)
                    }else{
                        console.log(user)
                        res.json(user)
                    }
                    
                })
            }else{

            res.json({
                message:'email is not avilable'
            })   
            }
        }
    })
    
})
router.get('/admin', async (req, res) => {
    try {
      const files = await Admin.find({});
      const sortedByCreationDate = files.sort(
        (a, b) => b.createdAt - a.createdAt
      );
      res.send(sortedByCreationDate);
    } catch (error) {
      res.status(400).send('Error while getting list of admins. Try again later.');
    }
  });

router.post('/signin',(req,res)=>{
    Admin.findOne({email:req.body.email,password:req.body.password},(err,result)=>{
        if (err) return res.status(500).json({ msg: err });
        if (result === null) {
          return res.status(403).json("Email is incorrect");
        }
        if (result.password === req.body.password) {
          let token = jwt.sign({ email: req.body.email }, config.key, {});
    
          res.json({
            token: token,
            msg: "success",
          });
        } else {
          res.status(403).json("password is incorrect");
        }
    })
})
module.exports = router
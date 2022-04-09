const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors');
const userFamilyRoute = require('./controllers/userFamily.controller');
const FamilyIRoute = require('./controllers/familyissues.contoller');
const AdminRoute = require('./controllers/admin.controllers');
const SocialRoute = require('./controllers/social.controller');
const financialIssueRoute = require('./controllers/financialissues.controller');
const adminFinanceIssueRoute = require('./controllers/adminFinance.controller');
const HealthRoute = require('./controllers/userHealth.controller');
const HealthIssueRoute = require('./controllers/healthIssue.controller');

dotenv.config();
const app = express();
app.use(cors());
app.use(express.urlencoded({extended: true}));
app.use(express.json());

// mongoose.connect("mongodb://localhost:27017/CtseDatabase", {useNewUrlParser:true},(error) =>{
//     if(error){
//         console.log('DataBase ERROR: ',error.message);
//     }
// });

const PORT = process.env.PORT || 8060;
const MONGODB_URI = process.env.MONGODB_URI;

mongoose.connect(MONGODB_URI,{
        useNewUrlParser:true,
        useUnifiedTopology:true,
},(error) =>{
    if(error){
        console.log('DataBase ERROR: ',error.message);
    }
});

mongoose.connection.once('open', () => {
    console.log('Database Synced');
});

app.use('/userDetails', userFamilyRoute);
app.use('/familyIDetails', FamilyIRoute);//Family Issues

app.use('/admin', AdminRoute);
app.use('/social', SocialRoute);//Social Issues
//Financial Issues
app.use('/financialDetails', financialIssueRoute);
app.use('/financeIssuesDetails', adminFinanceIssueRoute);

app.use('/healthDetails',HealthRoute);
app.use('/healthIssueDetails',HealthIssueRoute);


app.listen(PORT, () =>{
    console.log(`Server is running on PORT ${PORT}`);
});
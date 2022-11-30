

// config variables
const config = require('../config/app-config.js');

// express initialization
const express = require("express");
const app = express();

// set the view engine to ejs
app.set('view engine', 'ejs');

// required libraries
require('dotenv').config();
const helmet = require('helmet')
app.use(helmet())

// static folder
app.use(express.static(config.root));

// routes
app.use('/', require('./main.js'))
app.use('/login', require('./login.js'))
app.use('/dashboard', require('./dashboard.js'))
app.use('/ajax', require('./ajax.js'))

process.on("unhandledRejection", err => {
    console.log(err.stack)
    console.log("---------------")
})

const PORT = process.env.PORT || 5000
// server initialization
app.listen(PORT, () => console.log('Server is running'));

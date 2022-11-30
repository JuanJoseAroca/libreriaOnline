const path = require('path');
require('dotenv').config();

const config = {
    'root' : path.join(__dirname , '/../../'),
    'views' : path.join(__dirname , '/../views'),
    'controllers' : path.join(__dirname , '/../controllers'),
    'sqlCon' : {
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASS || '',
        database: process.env.DB_NAME || 'lib',
        port: process.env.DB_PORT
    },
    'populateCon' : {
        host: process.env.DB_HOST || 'localhost',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASS || '',
        database: process.env.DB_NAME || 'lib',
        port: process.env.DB_PORT,
        multipleStatements: true
    }
}

console.log(config)
module.exports = config;
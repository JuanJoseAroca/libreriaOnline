const path = require('path');
require('dotenv').config();

const config = {
    'root' : path.join(__dirname , '/../../'),
    'views' : path.join(__dirname , '/../views'),
    'controllers' : path.join(__dirname , '/../controllers'),
    'sqlCon' : {
        host: process.ENV.DB_HOST,
        user: process.ENV.DB_USER,
        password: process.ENV.DB_PASS,
        database: process.ENV.DB_NAME,
        port: process.ENV.DB_PORT,
        charset : 'utf8mb4'
    },
    'populateCon' : {
        host: process.ENV.DB_HOST,
        user: process.ENV.DB_USER,
        password: process.ENV.DB_PASS,
        database: process.ENV.DB_NAME,
        port: process.ENV.DB_PORT,
        charset : 'utf8mb4',
        multipleStatements: true
    }
}

module.exports = config;
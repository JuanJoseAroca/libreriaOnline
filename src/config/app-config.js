const path = require('path');
require('dotenv').config();

const config = {
    'root' : path.join(__dirname , '/../../'),
    'views' : path.join(__dirname , '/../views'),
    'controllers' : path.join(__dirname , '/../controllers'),
    'sqlCon' : {
        host: procces.ENV.DB_HOST,
        user: procces.ENV.DB_USER,
        password: procces.ENV.DB_PASS,
        database: procces.ENV.DB_NAME,
        port: procces.ENV.DB_PORT,
        charset : 'utf8mb4'
    },
    'populateCon' : {
        host: procces.ENV.DB_HOST,
        user: procces.ENV.DB_USER,
        password: procces.ENV.DB_PASS,
        database: procces.ENV.DB_NAME,
        port: procces.ENV.DB_PORT,
        charset : 'utf8mb4',
        multipleStatements: true
    }
}

module.exports = config;
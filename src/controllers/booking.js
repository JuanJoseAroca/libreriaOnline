const config = require('../config/app-config.js');
const mysql = require('mysql');

const controller = class ProductsController {
    constructor() {
        // mysql connection
        this.con = mysql.createConnection(config.sqlCon);
    }

    getContent(user) {
        return new Promise((resolve,reject) => {
            this.con.query('SELECT content FROM `booking` WHERE `user_id` ="'+user+'"', function (err, result) {
                if(err) reject(new Error('Database connection error'));
                if(result == undefined) {
                    reject();
                } else {
                    resolve(result[0]);
                }
            });
        });
    }

    addTobooking(newProducts, user){
        return new Promise( async(resolve,reject) => {

            try {
                let bookingContent = await this.getContent(user);
                let bookingProducts = JSON.parse(bookingContent.content);

                for(let bookingProduct of bookingProducts) {
                    for(let newProduct of newProducts) {
                        if (bookingProduct.id == newProduct.id && bookingProduct.size == newProduct.size) {
                            bookingProduct.quantity = newProduct.quantity + bookingProduct.quantity;
                            let index = newProducts.indexOf(newProduct);
                            newProducts.splice(index, 1);
                        }
                    }
                }

                bookingProducts = JSON.stringify(bookingProducts.concat(newProducts));

                this.con.query('UPDATE `booking` SET `content` = ? WHERE `user_id` = ?', [bookingProducts,user], function (err, result) {
                    if(err) reject(new Error('Database connection error'));
                    resolve('Added to the booking!');
                });

            } catch {
                let bookingRow = {user_id: user, content: JSON.stringify(newProducts)};
                this.con.query('INSERT INTO `booking` SET ?', bookingRow, function (err, result) {
                    if(err) reject(new Error('Database connection error'));
                    resolve('Added to the booking!');
                });
            }
        });
    }

    update(updateProduct, user) {
        return new Promise( async(resolve,reject) => {

            try {
                let bookingContent = await this.getContent(user);
                let bookingProducts = JSON.parse(bookingContent.content);
                let found = false;

                for (let bookingProduct of bookingProducts) {
                    if (bookingProduct.id == updateProduct.id && bookingProduct.size == updateProduct.size) {
                        found = true;
                        if (updateProduct.quantity > 0) {
                            bookingProduct.quantity = updateProduct.quantity;
                        } else {
                            let index = bookingProducts.indexOf(bookingProduct);
                            bookingProducts.splice(index, 1);
                        }
                    }
                }

                if (!found) bookingProducts.push(updateProduct);

                bookingProducts = JSON.stringify(bookingProducts);

                this.con.query('UPDATE `booking` SET `content` = ? WHERE `user_id` = ?', [bookingProducts,user], function (err, result) {
                    if(err) reject(new Error('Database connection error'));
                    resolve('Added to the booking!');
                });

            } catch {
                reject(new Error('Could not access booking'))
            }
        });
    }

    empty(user) {
        return new Promise((resolve,reject) => {
            this.con.query('DELETE FROM `booking` WHERE `user_id` ="'+user+'"', function (err, result) {
                if(err) {
                    reject(new Error('Database connection error'))
                } else {
                    resolve('booking emptied');
                }
            });
        });
    }
}

module.exports = controller;

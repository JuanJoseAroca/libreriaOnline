const config = require('../config/app-config.js');
const mysql = require('mysql');

const controller = class ProductsController {
    constructor() {
        // mysql connection
        this.con = mysql.createConnection(config.sqlCon);
    }

    async addAllDetails(product, sizes) {
        return new Promise( async (resolve,reject) => {
            try {
                await this.addProduct(product);
                let data = await this.getProductByName(product.title);
                let id = data[0].id
                for (let size of sizes) {
                    await this.addSizes(size, id);
                }
                resolve('Product updated successfully!');
            } catch (e) {
                reject(e);
            }
        });
    }

    getProductByName(title) {
        return new Promise((resolve,reject) => {
            this.con.query('SELECT id FROM products WHERE title = "'+ title + '"', function (err, result) {
                if(err) reject(err);
                if (result == undefined || typeof result == "undefined") {
                    reject(new Error("Product not registered"));
                } else {
                    resolve(result);
                }
            });
        });
    }

    addProduct(product) {
        return new Promise((resolve,reject) => {
            this.con.query('INSERT INTO `products` (title, description, year, autor, gender, num_pages, editorial, issn, language, publication_date, category) VALUES (?,?,?,?,?,?,?,?,?,?,?)', [product.title, product.description, product.year, product.autor, product.gender, product.num_pages, product.editorial, product.issn, product.language, product.publication_date, product.category], function (err, result) {
                if(err) reject(err);
                resolve();
            });
        });
    }

    addSizes(size, id) {
        return new Promise((resolve,reject) => {
            this.con.query('INSERT INTO `sizes` (product_id, size, price, stock) VALUES (?,?,?,?) ', [id, size.size, size.price, size.stock] , function (err, result) {
                if(err) reject(err);
                resolve();
            });
        });
    }

    getAll(){
        return new Promise((resolve,reject) => {
            this.con.query('SELECT * FROM `products` WHERE active = 1', function (err, result) {
                if (result == undefined) {
                    reject(new Error("No registered products"));
                } else {
                    resolve(result);
                }
            });
        });
    }

    getAllWithSizes() {
        return new Promise((resolve,reject) => {
            this.con.query('SELECT * FROM `sizes` JOIN products ON sizes.product_id = products.id WHERE active = 1', function (err, result) {
                if(err) reject(new Error(err));
                if (result == undefined) {
                    reject(new Error("No registered products"));
                } else {
                    resolve(result);
                }
            });
        });
    }

    getProduct(id) {
        return new Promise((resolve,reject) => {
            this.con.query('SELECT * FROM products JOIN sizes ON products.id = sizes.product_id WHERE id ='+id, function (err, result) {
                if(err) reject(err);
                if (result == undefined || typeof result == "undefined") {
                    reject(new Error("Product not registered"));
                } else {
                    resolve(result);
                }
            });
        });
    }

    deleteProduct(id) {
        return new Promise((resolve,reject) => {
            console.log(id)
            this.con.query('UPDATE `products` SET active = 0 WHERE id = '+id, function (err, result) {
                if(err) reject(err);
                if (result == undefined) {
                    reject(new Error("Product not registered"));
                } else {
                    resolve(result);
                }
            });
        });
    }

    getByIdArray(idList) {
        return new Promise((resolve,reject) => {
            this.con.query('SELECT id, title, sizes.size, sizes.price FROM products JOIN sizes ON products.id = sizes.product_id WHERE `id` IN ('+idList+')', function (err, result) {
                if(err) reject(err)
                if (result == undefined) {
                    reject(new Error("Products not registered"));
                } else {
                    resolve(result);
                }
            });
        });
    }

    checkStock(id, size) {
        return new Promise((resolve,reject) => {
            this.con.query('SELECT stock FROM sizes WHERE product_id = '+id+' AND size = "'+size+'"', function (err, result) {
                if(err) reject(err)
                if (result == undefined) {
                    reject(new Error("Product not registered"));
                } else {
                    resolve(result[0]);
                }
            });
        });
    }

    async updateAllDetails(product, sizes, id) {
        return new Promise( async (resolve,reject) => {
            try {
                await this.updateProduct(product, id);
                for (let size of sizes) {
                    await this.updateSizes(size, id);
                }
                resolve('Product updated successfully!');
            } catch (e) {
                reject(e);
            }
        });
    }

    updateProduct(product, id) {
        return new Promise((resolve,reject) => {
            this.con.query('UPDATE `products` SET ? WHERE `id` = ?', [product, id] , function (err, result) {
                if(err) reject(err);
                resolve();
            });
        });
    }

    updateSizes(size, id) {
        return new Promise((resolve,reject) => {
            this.con.query('UPDATE `sizes` SET ? WHERE `product_id` = ? AND `size` = ?', [size, id, size.size] , function (err, result) {
                if(err) reject(err);
                resolve();
            });
        });
    }

    getPaginated(page) {
        try {
            return new Promise((resolve,reject) => {
                this.con.query('SELECT * FROM `products` WHERE active = 1 ORDER BY ID ASC LIMIT 3 OFFSET ?', [page*3], function (err, result) {
                    // if (err) reject(err);
                    if (result == undefined) {
                        reject(new Error("No more products"));
                    } else {
                        resolve(result);
                    }
                });
            });
        }
        catch (err) {
            console.error(err)
            getPaginated(page)
        }  
    }
    
    getPaginatedNews(page) {
        try {
            return new Promise((resolve,reject) => {
                this.con.query('SELECT * FROM `products` WHERE active = 1 ORDER BY ID DESC LIMIT 3 OFFSET ?', [page*3], function (err, result) {
                    // if (err) reject(err);
                    if (result == undefined) {
                        reject(new Error("No more products"));
                    } else {
                        resolve(result);
                    }
                });
            });
        }
        catch (err) {
            console.error(err)
            getPaginated(page)
        }  
    }

    getPaginatedBestSellers(page) {
        try {
            return new Promise((resolve,reject) => {
                this.con.query('SELECT id, title, autor, description, gender, count(*) FROM products RIGHT JOIN orders_items ON products.id = orders_items.item_id GROUP BY id HAVING COUNT(*)>1 LIMIT 3', function (err, result) {
                    // if (err) reject(err);
                    if (result == undefined) {
                        reject(new Error("No more products"));
                    } else {
                        resolve(result);
                    }
                });
            });
        }
        catch (err) {
            console.error(err)
            getPaginated(page)
        }  
    }

    outOfStock() {
        return new Promise((resolve,reject) => {
            this.con.query('SELECT * FROM `sizes` RIGHT JOIN products ON sizes.product_id = products.id WHERE sizes.stock = 0', function (err, result) {
                if (err) reject(err);
                if (result == undefined) {
                    reject(new Error("All produtcs in stock!"));
                } else {
                    resolve(result);
                }
            });
        });
    }
}


module.exports = controller;














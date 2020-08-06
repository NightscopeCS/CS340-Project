module.exports = function(){
    var express = require('express');
    var router = express.Router();
  
    // Helper function to get all products 
    function getProducts(res, mysql, context, complete) {
        let sql = "SELECT productID, supplierID, productName, productPrice FROM Products";
        mysql.pool.query(sql, function(error, results, fields) {
        if(error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.products = results;
        complete();
        });
    }
  
    // Router - GET Products
    router.get('/', (req, res) => {
      var callbackCount = 0;
      var context = {};
      context.title = "Display Products";
  
      var mysql = req.app.get('mysql');
      getProducts(res, mysql, context, complete);
  
      function complete(){
        callbackCount++;
        if(callbackCount >= 1){
            res.render('products', context);
        }
      }
    });

    // Router - GET Add Products
    router.get('/add_products', function(req, res){
        var context = {};
        context.title = "Add Products";

        res.render('add_products', context);

    });

    // Add product to DB
    router.post('/add_products', (req, res) =>{
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Products (productName, productPrice) VALUES (?,?)";
        var inserts = [req.body.pname, req.body.price];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
        if (error){
            console.log(error);
            res.write(JSON.stringify(error));
            res.status(400);
            res.end();
        } else {
            res.status(202);
            res.redirect('/products');
        }
        });

    });

    return router;
}();
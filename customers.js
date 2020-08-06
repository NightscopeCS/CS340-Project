module.exports = function(){
    var express = require('express');
    var router = express.Router();
  
    // Helper function to get all customers 
    function getCustomers(res, mysql, context, complete) {
        let sql = "SELECT customerID, customerName, customerStreet, customerCity, customerState, customerPostalCode, customerCountry, customerPhone, customerEmail FROM Customers";
        mysql.pool.query(sql, function(error, results, fields) {
        if(error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.customers = results;
        complete();
        });
    }
  
    // Router - GET Customers
    router.get('/', (req, res) => {
      var callbackCount = 0;
      var context = {};
      context.title = "Display Customers";
  
      var mysql = req.app.get('mysql');
      getCustomers(res, mysql, context, complete);
  
      function complete(){
        callbackCount++;
        if(callbackCount >= 1){
            res.render('customers', context);
        }
      }
    });

    // Router - GET Add Customers
    router.get('/add_customers', function(req, res){
        var context = {};
        context.title = "Add Customers";

        res.render('add_customers', context);

    });

    // Add Customer to DB
    router.post('/add_customers', (req, res) =>{
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Customers (customerName, customerStreet, customerCity, customerState, customerPostalCode, customerCountry, customerPhone, customerEmail) VALUES (?,?,?,?,?,?,?,?)";
        var inserts = [req.body.name, req.body.street, req.body.city, req.body.state, req.body.postal, req.body.country, req.body.phone, req.body.email];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
        if (error){
            console.log(error);
            res.write(JSON.stringify(error));
            res.status(400);
            res.end();
        } else {
            res.status(202);
            res.redirect('/customers');
        }
        });

    });

    return router;
}();
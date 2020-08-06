module.exports = function(){
    var express = require('express');
    var router = express.Router();
  
    // Helper function to get all suppliers
    function getSuppliers(res, mysql, context, complete) {
        let sql = "SELECT supplierID, supplierName, supplierStreet, supplierCity, supplierState, supplierPostalCode, supplierCountry FROM Suppliers";
        mysql.pool.query(sql, function(error, results, fields) {
        if(error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.suppliers = results;
        complete();
        });
    }
  
    // Router - GET Suppliers
    router.get('/', (req, res) => {
      var callbackCount = 0;
      var context = {};
      context.title = "Display Suppliers";
  
      var mysql = req.app.get('mysql');
      getSuppliers(res, mysql, context, complete);
  
      function complete(){
        callbackCount++;
        if(callbackCount >= 1){
            res.render('suppliers', context);
        }
      }
    });

    // Router - GET Add Suppliers
    router.get('/add_suppliers', function(req, res){
        var context = {};
        context.title = "Add Suppliers";

        res.render('add_suppliers', context);

    });

    // Add Supplier to DB
    router.post('/add_suppliers', (req, res) =>{
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Suppliers (supplierName, supplierStreet, supplierCity, supplierState, supplierPostalCode, supplierCountry) VALUES (?,?,?,?,?,?)";
        var inserts = [req.body.name, req.body.street, req.body.city, req.body.state, req.body.postal, req.body.country];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
        if (error){
            console.log(error);
            res.write(JSON.stringify(error));
            res.status(400);
            res.end();
        } else {
            res.status(202);
            res.redirect('/suppliers');
        }
        });

    });

    return router;
}();
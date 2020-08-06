module.exports = function(){
    var express = require('express');
    var router = express.Router();
  
    // Helper function to get all orders 
    function getOrders(res, mysql, context, complete) {
        let sql = "SELECT orderID, customerID, orderDate, shippedDate FROM Orders";
        mysql.pool.query(sql, function(error, results, fields) {
        if(error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.orders = results;
        complete();
        });
    }
  
    // Router - GET Orders
    router.get('/', (req, res) => {
      var callbackCount = 0;
      var context = {};
      context.title = "Display Orders";
  
      var mysql = req.app.get('mysql');
      getOrders(res, mysql, context, complete);
  
      function complete(){
        callbackCount++;
        if(callbackCount >= 1){
            res.render('orders', context);
        }
      }
    });

    // Router - GET Add Orders
    router.get('/add_orders', function(req, res){
        var context = {};
        context.title = "Add Orders";

        res.render('add_orders', context);

    });

    // Add Order to DB
    router.post('/add_orders', (req, res) =>{
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Orders (orderDate, shippedDate) VALUES (?,?)";
        var inserts = [req.body.odate, req.body.sdate];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
        if (error){
            console.log(error);
            res.write(JSON.stringify(error));
            res.status(400);
            res.end();
        } else {
            res.status(202);
            res.redirect('/orders');
        }
        });

    });

    return router;
}();
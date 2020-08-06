module.exports = function(){
    var express = require('express');
    var router = express.Router();
  
    // Helper function to get all beans 
    function getBeans(res, mysql, context, complete) {
        let sql = "SELECT beanID, beanName FROM Beans";
        mysql.pool.query(sql, function(error, results, fields) {
        if(error) {
            res.write(JSON.stringify(error));
            res.end();
        }
        context.beans = results;
        complete();
        });
    }
  
    // Router - GET Beans
    router.get('/', (req, res) => {
      var callbackCount = 0;
      var context = {};
      context.title = "Display Beans";
  
      var mysql = req.app.get('mysql');
      getBeans(res, mysql, context, complete);
  
      function complete(){
        callbackCount++;
        if(callbackCount >= 1){
            res.render('beans', context);
        }
      }
    });

    // Router - GET Add Beans
    router.get('/add_beans', function(req, res){
        var context = {};
        context.title = "Add Beans";

        res.render('add_beans', context);

    });

    // Add Beans to DB
    router.post('/add_beans', (req, res) =>{
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Beans (beanName) VALUES (?)";
        var inserts = [req.body.bname];
        sql = mysql.pool.query(sql, inserts, function(error, results, fields){
        if (error){
            console.log(error);
            res.write(JSON.stringify(error));
            res.status(400);
            res.end();
        } else {
            res.status(202);
            res.redirect('/beans');
        }
        });

    });

    return router;
}();
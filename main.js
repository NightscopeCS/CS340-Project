var express = require('express');
var mysql = require('./dbcon.js');
var bodyParser = require('body-parser');

var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main',});

app.engine('handlebars', handlebars.engine);
app.use(bodyParser.urlencoded({extended:true}));
app.use('/static', express.static('public'));
app.set('view engine', 'handlebars');
app.set('port', process.argv[2]);
app.set('mysql', mysql);
app.use('/customers', require('./customers.js'));
app.use('/products', require('./products.js'));
app.use('/orders', require('./orders.js'));
app.use('/beans', require('./beans.js'));
app.use('/suppliers', require('./suppliers.js'));

app.get('/', function(req, res){
  res.render('home', {title:'The Busy Bean Database'});
});

app.use(function(req,res){
  res.status(404);
  res.render('404');
});
  
app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500');
});
  
app.listen(app.get('port'), function(){
  console.log('Express started on http://flip3.engr.oregonstate.edu:' + app.get('port') + '; press Ctrl-C to terminate.');
});
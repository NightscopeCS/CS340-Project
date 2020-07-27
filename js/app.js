var express = require("express");

var app = express();

var handlebars = require("express-handlebars").create({defaultLayout:"main"});
var bodyParser = require("body-parser");
var cors = require("cors");

module.exports.pool = pool;

app.engine("handlebars", handlebars.engine);
app.set("view engine", "handlebars");
app.set("port", 1752);

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(express.static('public'));
app.use(cors());

// Error handling
app.use(function(req,res){
  res.status(404);
  res.render("404");
});

app.use(function(err,req,res,next){
  console.error(err.stack);
  res.type("plain/text");
  res.status(500);
  res.render("500");
});

// Begins Express process and displays Host/Port
app.listen(app.get("port"), function(){
    console.log(`Express started on ${process.env.HOSTNAME}:${app.get("port")}; press Ctrl-C to terminate.`);
  });
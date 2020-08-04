var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_hardinre',
  password        : 'kiyah4646',
  database        : 'cs340_hardinre'
});

module.exports.pool = pool;

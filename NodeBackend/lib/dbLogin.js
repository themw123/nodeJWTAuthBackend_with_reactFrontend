const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "est",
  database: "login",
  password: "***REMOVED***",
});
connection.connect();
module.exports = connection;

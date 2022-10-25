const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "est",
  database: "platinendb",
  password: "***REMOVED***",
});
connection.connect();
module.exports = connection;

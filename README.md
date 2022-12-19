Run both: React Frontend and Node Backend with:

npm run start

Attention! Create a mysql database as expected and set it up in NodeBackend/lib
Otherwise the node server will crash.

example:
const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "user",
  database: "login",
  password: "123456",
});
connection.connect();
module.exports = connection;

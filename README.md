Starte beides, React Frontend und Node Backend mit:

npm run start

Achtung! Erstelle eine Mysql Datenbank wie sie erwartet wird in NodeBackend/lib. Ansonnsten wird der node server abstürtzen.

Beispiel:
```  
const mysql = require("mysql");  
const connection = mysql.createConnection({  
host: "localhost",  
user: "user",  
database: "login",  
password: "123456",  
});  
connection.connect();  
module.exports = connection;  
```

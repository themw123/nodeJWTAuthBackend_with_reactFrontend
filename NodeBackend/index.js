const express = require("express");
const app = express();
const cors = require("cors");
const cookie = require("cookie-parser");

//Anleitung
//https://webdeasy.de/en/complete-login-system-with-node-js-vue-js-restapi-jwt-part-1-2/

// set up port
const PORT = process.env.PORT || 3000;
app.use(express.json());
app.use(cors());
app.use(cookie());

// add routes
const router = require("./routes/router.js");
app.use("/api", router);
// run server
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

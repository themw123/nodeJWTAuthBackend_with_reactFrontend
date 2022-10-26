const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const uuid = require("uuid");
const jwt = require("jsonwebtoken");
const dbLogin = require("../lib/dbLogin.js");
const dbPlatinendb = require("../lib/dbPlatinendb.js");

const userMiddleware = require("../middleware/users.js");

router.post("/login", (req, res, next) => {
  //empty
  if (
    req.body.username == undefined ||
    req.body.username == "" ||
    req.body.password == undefined ||
    req.body.password == ""
  ) {
    //throw err;
    return res.status(401).send({
      msg: "Please specify a username and password.",
    });
  }

  dbLogin.query(
    `SELECT * FROM users WHERE user_name = ${dbLogin.escape(
      req.body.username
    )};`,
    (err, result) => {
      // user does not exists
      if (result.length == 0) {
        //throw err;
        return res.status(401).send({
          msg: "User does not exist!",
        });
      }
      if (!result.length) {
        return res.status(401).send({
          msg: "Username or password is incorrect!",
          status: "error",
        });
      }
      // check password
      bcrypt.compare(
        req.body.password,
        result[0]["user_password_hash"],
        (bErr, bResult) => {
          // wrong password
          if (bErr) {
            //throw bErr;
            return res.status(401).send({
              msg: "Username or password is incorrect!",
              status: "error",
            });
          }
          if (bResult) {
            const token = jwt.sign(
              {
                username: result[0].user_name,
                userId: result[0].user_id,
              },
              "SECRETKEYx",
              {
                expiresIn: "7d",
              }
            );
            /*
            dbLogin
              .query
              `UPDATE users SET last_login = now() WHERE id = '${result[0].id}'`
              ();
            */

            const decoded = jwt.verify(token, "SECRETKEYx");
            const exp = decoded.exp;

            res.cookie("MarvCompanyToken", token, { httpOnly: true });
            res.json({
              msg: "Logged in!",
              status: "ok",
              token: "Bearer " + token,
              exp: exp,
              admin: result[0].admin,
            });
            /*
            
            //cookie better to use
            return res.status(200).send({
              
              msg: "Logged in!",
              status: "ok",
              token: "Bearer " + token,
              admin: result[0].admin,
              //user: result[0],
              

            });
            */
          } else {
            return res.status(401).send({
              msg: "Username or password is incorrect!",
              status: "error",
            });
          }
        }
      );
    }
  );
});

router.post("/register", userMiddleware.validateRegister, (req, res, next) => {
  dbLogin.query(
    `SELECT * FROM users WHERE LOWER(user_name) = LOWER(${dbLogin.escape(
      req.body.username
    )});`,
    (err, result) => {
      if (result.length) {
        return res.status(409).send({
          msg: "This username is already in use!",
          status: "error",
        });
      } else {
        // username is available
        bcrypt.hash(req.body.password, 10, (err, hash) => {
          if (err) {
            return res.status(500).send({
              msg: err,
            });
          } else {
            // has hashed pw => add to database
            dbLogin.query(
              `INSERT INTO users (user_id, user_name, user_password_hash, user_email, lehrstuhl) VALUES ('${uuid.v4()}', ${dbLogin.escape(
                req.body.username
              )}, ${dbLogin.escape(hash)}, ${dbLogin.escape(
                req.body.email
              )}, 1)`,
              (err, result) => {
                if (err) {
                  //throw err;
                  return res.status(400).send({
                    msg: err,
                    status: "error",
                  });
                }
                return res.status(201).send({
                  msg: "Registered!",
                  status: "ok",
                });
              }
            );
          }
        });
      }
    }
  );
});

router.post("/logout", userMiddleware.isLoggedIn, (req, res, next) => {
  res.clearCookie("MarvCompanyToken");

  return res.status(201).send({
    msg: "You got logged out.",
    status: "ok",
  });
});

/*

router.post("/logout", userMiddleware.isLoggedIn, (req, res, next) => {
  
  const authHeader = req.headers["authorization"];

  res.send("This is the secret content. Only logged in users can see that!");

});
*/

router.get("/normal-route", (req, res) => {
  res.send("Everybody can see this.");
});

router.get("/secret-route", userMiddleware.isLoggedIn, (req, res, next) => {
  console.log(req.userData);
  res.send("This is the secret content. Only logged in users can see that!");
});

router.get("/getPlatinen", userMiddleware.isLoggedIn, (req, res, next) => {
  dbPlatinendb.query(`Select * from platinen`, (err, result) => {
    if (err) {
      //throw err;
    }
    return res.status(200).send({
      status: "ok",
      result,
    });
  });
});

router.get(
  "/getNutzen",
  userMiddleware.isLoggedIn,
  userMiddleware.isAdmin,
  (req, res, next) => {
    dbPlatinendb.query(`Select * from nutzen`, (err, result) => {
      if (err) {
        throw err;
        /*
      return res.status(400).send({
        msg: err,
      });
      */
      }
      return res.status(200).send({
        status: "ok",
        result,
      });
    });
  }
);

router.get("/getUser", userMiddleware.isLoggedIn, (req, res, next) => {
  return res.status(200).send({
    status: "ok",
    result: req.userData,
  });
});

module.exports = router;

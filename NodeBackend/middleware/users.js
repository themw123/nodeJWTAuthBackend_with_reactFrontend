const jwt = require("jsonwebtoken");
const dbLogin = require("../lib/dbLogin.js");

module.exports = {
  isLoggedIn: (req, res, next) => {
    try {
      /*
      const token = req.headers.authorization.split(" ")[1];
      */

      const token = req.cookies.MarvCompanyToken;

      const decoded = jwt.verify(token, "SECRETKEYx");
      req.userData = decoded;

      //user still existing in database?
      const userId = req.userData.userId;
      dbLogin.query(
        `Select * from users where user_id = ?`,
        [userId],
        (err, result) => {
          if (err) {
            return res.status(401).send({
              status: "error",
            });
          }
          if (result.length == 0) {
            return res.status(401).send({
              msg: "User not existing in Database",
              status: "error",
            });
          }
          next();
        }
      );
    } catch (err) {
      return res.status(401).send({
        msg: "You are not allowed to do This.",
        status: "error",
      });
    }
  },
  isAdmin: (req, res, next) => {
    const userId = req.userData.userId;
    dbLogin.query(
      `Select admin from users where user_id = ?`,
      [userId],
      (err, result) => {
        if (err) {
          return res.status(401).send({
            status: "error",
          });
        }
        const admin = result[0].admin;
        if (admin == 0) {
          return res.status(401).send({
            msg: "You are not an Admin!",
            status: "error",
          });
        }
        next();
      }
    );
  },
  validateRegister: (req, res, next) => {
    // username min length 3
    if (!req.body.username || req.body.username.length < 3) {
      return res.status(400).send({
        msg: "Please enter a username with min. 3 chars",
        status: "error",
      });
    }
    // password min 6 chars
    if (!req.body.password || req.body.password.length < 6) {
      return res.status(400).send({
        msg: "Please enter a password with min. 6 chars",
        status: "error",
      });
    }
    // password (repeat) does not match
    if (
      !req.body.password_repeat ||
      req.body.password != req.body.password_repeat
    ) {
      return res.status(400).send({
        msg: "Both passwords must match",
        status: "error",
      });
    }
    next();
  },
};

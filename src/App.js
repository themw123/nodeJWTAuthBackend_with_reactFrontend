import React from "react";
import { useState, useEffect, useMemo } from "react";
import OnChangeRoute from "./components/onChangeRoute";

import "../node_modules/bootstrap/dist/css/bootstrap.min.css";
import "./App.css";
import Main from "./components/main";
import Dashboard from "./components/dashboard";
import Login from "./components/login";
import Register from "./components/register";

import Container from "react-bootstrap/Container";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";

import { Routes, Route, Link, useNavigate } from "react-router-dom";

import { useMediaQuery } from "react-responsive";
import Protected from "./components/protected";

import auth from "./components/auth";

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { library } from "@fortawesome/fontawesome-svg-core";
import { faXmark, faBars } from "@fortawesome/free-solid-svg-icons";

library.add(faXmark, faBars);

function App() {
  const authx = auth();
  const loggedIn = authx.loggedIn;
  const doLogin = authx.doLogin;
  const doLogout = authx.doLogout;
  const checkLocalStorage = authx.checkLocalStorage;
  const isAdmin = authx.isAdmin;

  useMemo(() => {
    checkLocalStorage();
  }, []);

  const breakNav = useMediaQuery({ query: "(max-width: 991px)" });

  const [navIcon, setNavIcon] = useState("bars");

  function changeIcon(e) {
    if (navIcon == "bars") {
      setNavIcon("xmark");
    } else {
      setNavIcon("bars");
    }
  }

  return (
    <OnChangeRoute loggedIn={loggedIn} doLogout={doLogout}>
      <div style={{ height: "100%", width: "100%" }}>
        <Navbar sticky="top" bg="light" expand="lg">
          <Container fluid>
            <Navbar.Brand as={Link} to="/">
              MarvCompany
            </Navbar.Brand>
            <Navbar.Toggle
              aria-controls="navbarScroll"
              onClick={(e) => changeIcon()}
            >
              <FontAwesomeIcon icon={navIcon} />
            </Navbar.Toggle>

            <Navbar.Collapse id="navbarScroll">
              <Nav
                className="me-auto my-2 my-lg-0"
                style={{ maxHeight: "200px", width: "100%" }}
                navbarScroll
              >
                {loggedIn ? (
                  <Nav.Link as={Link} to="/dashboard">
                    Dashboard
                  </Nav.Link>
                ) : (
                  <Nav.Link as={Link} to="/login">
                    Dashboard
                  </Nav.Link>
                )}

                {!loggedIn && (
                  <div
                    style={
                      breakNav ? {} : { display: "flex", marginLeft: "auto" }
                    }
                  >
                    <Nav.Link as={Link} to="/login">
                      Login
                    </Nav.Link>
                    <Nav.Link as={Link} to="/register">
                      Register
                    </Nav.Link>
                  </div>
                )}
              </Nav>

              <Nav
                className="ms-auto my-2 my-lg-0"
                style={
                  loggedIn
                    ? { display: "inline", maxHeight: "200px" }
                    : { display: "none", maxHeight: "200px" }
                }
                navbarScroll
              >
                <Nav.Link as={Link} onClick={() => doLogout(true)}>
                  Logout
                </Nav.Link>
              </Nav>
            </Navbar.Collapse>
          </Container>
        </Navbar>

        <div
          className="page"
          style={{
            height: "90%",
            width: "100%",
          }}
        >
          <Routes>
            <Route exact path="/" element={<Main />} />

            <Route
              path="/dashboard"
              element={
                <Protected loggedIn={loggedIn}>
                  <Dashboard />
                </Protected>
              }
            />

            <Route path="/login" element={<Login doLogin={doLogin} />} />
            <Route path="/register" element={<Register />} />
          </Routes>
        </div>
      </div>
    </OnChangeRoute>
  );
}
export default App;

import { useState } from "react";

import { useNavigate } from "react-router-dom";

export default function Auth() {
  const navigate = useNavigate();

  const [loggedIn, setLogin] = useState(false);

  async function loginRequest(credentials) {
    return fetch("api/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(credentials),
    }).then((data) => data.json());
  }

  async function logoutRequest() {
    return fetch("api/logout", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
    }).then((data) => data.json());
  }

  const doLogin = async (e, username, password) => {
    const tokenRequest = await loginRequest({
      username,
      password,
    });

    if (tokenRequest.status == "ok") {
      setLogin(true);
      localStorage.setItem("loggedIn", true);
      var admin = false;
      if (tokenRequest.admin) {
        admin = true;
      }
      localStorage.setItem("admin", admin);
      localStorage.setItem("exp", tokenRequest.exp);
      navigate("/dashboard");
    }

    const answer = {
      status: tokenRequest.status,
      msg: tokenRequest.msg,
    };

    return answer;
  };

  const doLogout = async (withRequest) => {
    var tokenRequest;
    if (withRequest) {
      tokenRequest = await logoutRequest();
    } else {
      setLogin(false);
      localStorage.clear();
      return;
    }
    if (tokenRequest.status == "ok") {
      setLogin(false);
      localStorage.clear();
    }
  };

  const checkLocalStorage = () => {
    /*
    const par1 = JSON.parse(localStorage.getItem("token"));
    const par2 = JSON.parse(localStorage.getItem("admin"));
    if (par1 != null && par2 != null) {
      setLogin(true);
    }
    */
    const loggedIn = JSON.parse(localStorage.getItem("loggedIn"));

    if (loggedIn) {
      setLogin(true);
    }
  };

  const isAdmin = () => {
    const par = JSON.parse(localStorage.getItem("admin"));

    if (par != null && par == 1) {
      return true;
    } else {
      return false;
    }
  };

  return {
    loggedIn,
    doLogin,
    doLogout,
    checkLocalStorage,
    isAdmin,
  };
}

import React, { useState } from "react";
import Alert from "react-bootstrap/Alert";
import Button from "react-bootstrap/Button";
import Spinner from "react-bootstrap/Spinner";

export default function Login(props) {
  const [username, setUsername] = useState();
  const [password, setPassword] = useState();

  const [buttonState, setButtonState] = useState("");

  const [variant, setVariant] = useState("danger");
  const [text, setText] = useState("");
  const [textState, setTextState] = useState("none");

  const handleLogin = async (e) => {
    e.preventDefault();
    setButtonState("disabled");
    setTextState("none");

    const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
    await delay(1000);

    var answer = await props.doLogin(e, username, password);

    if (answer.status != "ok") {
      setTextState("flex");
      setText(answer.msg);
      /*
      setTimeout(() => {
        setTextState("none");
      }, 5000);
      */
    }
    setButtonState("");
  };

  return (
    <div
      className="login"
      style={{
        height: "100%",
        width: "100%",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <div
        className="card"
        style={{
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          padding: "30px",
        }}
      >
        <div className="card-body">
          <form onSubmit={(e) => handleLogin(e)}>
            <h3>Login</h3>
            <div className="mb-3">
              <label>Username</label>
              <input
                type="name"
                className="form-control"
                placeholder="Enter Username"
                onChange={(e) => setUsername(e.target.value)}
              />
            </div>
            <div className="mb-3">
              <label>Password</label>
              <input
                type="password"
                className="form-control"
                placeholder="Enter password"
                onChange={(e) => setPassword(e.target.value)}
              />
            </div>
            <div className="mb-3">
              <div className="custom-control custom-checkbox">
                <input
                  type="checkbox"
                  className="custom-control-input"
                  id="customCheck1"
                />
                <label className="custom-control-label" htmlFor="customCheck1">
                  Remember me
                </label>
              </div>
            </div>
            <div className="d-grid">
              <Button type="submit" variant="primary" disabled={buttonState}>
                <Spinner
                  className={buttonState != "disabled" ? "visually-hidden" : ""}
                  as="span"
                  animation="border"
                  size="sm"
                  role="status"
                  aria-hidden="true"
                />
                <span
                  style={{ fontWeight: "normal" }}
                  className={buttonState == "disabled" ? "visually-hidden" : ""}
                >
                  Submit
                </span>
              </Button>
            </div>
            <p className="forgot-password text-right">
              Forgot <a href="#">password?</a>
            </p>
            <Alert
              style={{ marginTop: "20px", display: textState }}
              key={variant}
              variant={variant}
            >
              {text}
            </Alert>
          </form>
        </div>
      </div>
    </div>
  );
}

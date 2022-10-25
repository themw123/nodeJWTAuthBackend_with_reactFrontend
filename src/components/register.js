import React, { useState } from "react";
import Alert from "react-bootstrap/Alert";
import Button from "react-bootstrap/Button";
import Spinner from "react-bootstrap/Spinner";

export default function Register() {
  const [buttonState, setButtonState] = useState("");

  const [variant, setVariant] = useState("danger");
  const [text, setText] = useState("");
  const [textState, setTextState] = useState("none");

  const handleRegister = async (e) => {
    /*
    e.preventDefault();
    setTextState("none");
    setButtonState("disabled");

    const delay = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
    await delay(1000);

    var answer = await props.doLogin(e, username, password);

    if (answer.status != "ok") {
      setTextState("flex");
      setText(answer.msg);
      
      setTimeout(() => {
        setTextState("none");
      }, 5000);
    
    }
    setButtonState("");
    */
  };

  return (
    <div
      className="register"
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
          <form onSubmit={(e) => handleRegister(e)}>
            <h3>Register</h3>

            <div className="mb-3">
              <label>First name</label>
              <input
                type="text"
                className="form-control"
                placeholder="First name"
              />
            </div>

            <div className="mb-3">
              <label>Email address</label>
              <input
                type="email"
                className="form-control"
                placeholder="Enter email"
              />
            </div>

            <div className="mb-3">
              <label>Password</label>
              <input
                type="password"
                className="form-control"
                placeholder="Enter password"
              />
            </div>

            <div className="mb-3">
              <label>Repeat Password</label>
              <input
                type="password"
                className="form-control"
                placeholder="Enter password"
              />
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
              Already registered <a href="/sign-in">login?</a>
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

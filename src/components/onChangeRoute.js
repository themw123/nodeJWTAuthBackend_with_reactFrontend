import { useEffect } from "react";
import { useLocation } from "react-router-dom";

function OnChangeRoute(props) {
  const location = useLocation();
  const exp = JSON.parse(localStorage.getItem("exp"));
  const expirationTime = exp * 1000;

  useEffect(() => {
    /*
    console.log("Location changed");
    console.log(loggedIn);
    */
    if (props.loggedIn && Date.now() >= expirationTime) {
      props.doLogout(false);
      /*
      console.log(exp);
      console.log(Date.now());
      console.log(expirationTime);
      */
    }
  }, [location]);

  return props.children;
}

export default OnChangeRoute;

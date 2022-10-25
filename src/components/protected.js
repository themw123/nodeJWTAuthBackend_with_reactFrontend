import { Navigate } from "react-router-dom";
const Protected = (props) => {
  if (!props.loggedIn) {
    return <Navigate to="/login" replace />;
  }

  return props.children;
};
export default Protected;

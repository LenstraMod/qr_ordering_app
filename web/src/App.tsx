import { useEffect, useState } from "react"


export default function App(){

  const [message,setMessage] = useState("Loading....");

  useEffect(() => {
    fetch("http://localhost:8080/api/send")
      .then(r => r.text())
      .then(setMessage)
      .catch(() => setMessage("Backend not reachable"));
  });

  return(
    <>
    <h1>QR BASED APP FOR FOOD ORDERING FOR SCHOOLS 🏫🎒</h1>
      <p>{message}</p>
    </>
  )
}

import { useEffect, useState } from "react";

function App() {
  const [status, setStatus] = useState("Checking backend...");

  useEffect(() => {
    fetch(`${import.meta.env.VITE_API_URL}/health`)
      .then((response) => {
        if (!response.ok) {
          throw new Error("Backend request failed");
        }

        return response.json();
      })
      .then((data) => {
        setStatus(data.status);
      })
      .catch(() => {
        setStatus("Backend connection failed");
      });
  }, []);

  return (
    <div>
      <h1>Production Kubernetes Platform</h1>
      <p>Backend status v2: {status}</p>
    </div>
  );
}

export default App;
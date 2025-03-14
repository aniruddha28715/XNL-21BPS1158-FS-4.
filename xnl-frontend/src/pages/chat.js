import { useState, useEffect, useRef } from "react";
import axios from "axios";

export default function Chat() {
  const [messages, setMessages] = useState([]);
  const [message, setMessage] = useState("");
  const ws = useRef(null);

  useEffect(() => {
    ws.current = new WebSocket("ws://127.0.0.1:8000/ws/chat");
    ws.current.onmessage = (event) => {
      setMessages((prev) => [...prev, event.data]);
    };
    return () => ws.current.close();
  }, []);

  const sendMessage = async () => {
    ws.current.send(message);
    await axios.post("http://127.0.0.1:8000/api/chat", { sender_id: 1, receiver_id: 2, message });
    setMessage("");
  };

  return (
    <div className="chat-container">
      <div className="messages">
        {messages.map((msg, index) => (
          <div key={index} className="message">{msg}</div>
        ))}
      </div>
      <input type="text" value={message} onChange={(e) => setMessage(e.target.value)} />
      <button onClick={sendMessage}>Send</button>
    </div>
  );
}

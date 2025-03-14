import { useState } from "react";
import { motion } from "framer-motion";

export default function Messages() {
  const [messages, setMessages] = useState([
    { sender: "client", text: "Hello, I'm interested in your job!" },
    { sender: "freelancer", text: "Great! Let's discuss the details." }
  ]);
  const [newMessage, setNewMessage] = useState("");

  const sendMessage = () => {
    if (newMessage.trim()) {
      setMessages([...messages, { sender: "freelancer", text: newMessage }]);
      setNewMessage("");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-green-500 to-blue-500 text-white">
      <motion.div
        className="bg-white p-6 rounded-lg shadow-lg w-96 text-gray-900"
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.8 }}
      >
        <h2 className="text-2xl font-bold text-blue-600 text-center">💬 Messages</h2>
        <div className="mt-4 space-y-3">
          {messages.map((msg, index) => (
            <div key={index} className={`p-3 rounded-lg ${msg.sender === "freelancer" ? "bg-blue-200" : "bg-gray-200"}`}>
              {msg.text}
            </div>
          ))}
        </div>
        <div className="mt-4 flex space-x-2">
          <input
            type="text"
            placeholder="Type a message..."
            className="p-2 border rounded-lg w-full"
            value={newMessage}
            onChange={(e) => setNewMessage(e.target.value)}
          />
          <button className="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700" onClick={sendMessage}>
            ➤
          </button>
        </div>
      </motion.div>
    </div>
  );
}

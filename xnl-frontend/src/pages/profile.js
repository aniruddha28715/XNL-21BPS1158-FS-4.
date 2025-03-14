import { motion } from "framer-motion";

export default function Profile() {
  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-green-400 to-blue-500 text-white">
      <motion.div
        className="bg-white p-6 rounded-lg shadow-lg text-gray-900 w-96"
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.8 }}
      >
        <h2 className="text-3xl font-bold text-center text-blue-600">👤 Your Profile</h2>
        <p className="text-center text-gray-500 mb-4">Manage your freelancer account</p>
        <div className="flex flex-col space-y-3">
          <input type="text" placeholder="Your Name" className="p-3 border rounded-lg" />
          <input type="email" placeholder="Your Email" className="p-3 border rounded-lg" />
          <button className="bg-blue-600 text-white py-2 rounded-lg shadow-md hover:bg-blue-700 transition-all">
            Save Changes
          </button>
        </div>
      </motion.div>
    </div>
  );
}

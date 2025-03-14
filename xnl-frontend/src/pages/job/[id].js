import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import axios from "axios";
import { motion } from "framer-motion";

export default function JobDetails() {
  const router = useRouter();
  const { id } = router.query;
  const [job, setJob] = useState(null);

  useEffect(() => {
    if (id) {
      axios.get(`http://127.0.0.1:8000/api/jobs/${id}`)
        .then((res) => setJob(res.data))
        .catch((err) => console.error("Error fetching job:", err));
    }
  }, [id]);

  if (!job) return <p className="text-center text-lg mt-10">Loading job details...</p>;

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-indigo-500 to-purple-600 text-white">
      <motion.div
        className="bg-white text-gray-900 p-6 rounded-lg shadow-lg w-96"
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.8 }}
      >
        <h1 className="text-3xl font-bold text-blue-600">{job.title}</h1>
        <p className="text-gray-700 mt-3">{job.description}</p>
        <p className="mt-3 text-gray-500"><strong>Budget:</strong> $500 (Mock Data)</p>
        <button className="mt-5 bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 transition">
          📝 Apply for Job
        </button>
      </motion.div>
    </div>
  );
}

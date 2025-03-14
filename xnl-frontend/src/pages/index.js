import { useEffect, useState } from "react";
import axios from "axios";
import { motion } from "framer-motion";
import gsap from "gsap";

export default function Home() {
  const [jobs, setJobs] = useState([]);

  useEffect(() => {
    axios.get("http://localhost:8000/api/jobs") // 🔹 Changed from 127.0.0.1 to localhost
      .then((res) => setJobs(res.data))
      .catch((err) => console.error("Error fetching jobs:", err));

    // GSAP Animation for Job Cards
    gsap.fromTo(
      ".job-card",
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: 0.8, stagger: 0.2 }
    );
  }, []);

  return (
    <div className="min-h-screen bg-gradient-to-r from-blue-500 to-purple-500 text-white">
      <div className="flex flex-col items-center justify-center h-64">
        <h1 className="text-5xl font-extrabold">🚀 Find Your Dream Job</h1>
        <p className="text-lg mt-3 opacity-90">Join thousands of freelancers & clients worldwide!</p>
        <a href="/jobs">
          <button className="mt-5 bg-white text-blue-600 py-3 px-6 rounded-lg shadow-md hover:bg-gray-200 transition-all">
            🔍 Browse Jobs
          </button>
        </a>
      </div>

      <div className="container mx-auto p-6">
        <h2 className="text-3xl font-bold mb-5 text-center">🔥 Latest Jobs</h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {jobs.map((job) => (
            <motion.div
              key={job.id}
              className="job-card bg-white p-6 rounded-lg shadow-md text-gray-900"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.3 }}
            >
              <h3 className="text-xl font-semibold">{job.title}</h3>
              <p className="text-gray-600">{job.description}</p>
              <a href={`/job/${job.id}`} className="mt-3 inline-block text-blue-600 hover:underline">
                View Details →
              </a>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
}

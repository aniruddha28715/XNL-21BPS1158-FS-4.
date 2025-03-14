import { useState, useEffect, useRef } from "react";
import gsap from "gsap";
import axios from "axios";

const API_URL = "http://127.0.0.1:8000/jobs"; // ✅ Ensure API URL is defined

export default function JobPost() {
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [jobs, setJobs] = useState([]); // ✅ Store job listings
  const [loading, setLoading] = useState(true); // ✅ Added loading state
  const formRef = useRef(null);
  const ws = useRef(null); // ✅ WebSocket reference

  useEffect(() => {
    gsap.fromTo(
      formRef.current,
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: 0.8 }
    );

    fetchJobs(); // ✅ Fetch jobs on mount

    // ✅ Initialize WebSocket Connection
    ws.current = new WebSocket("ws://127.0.0.1:8000/ws/jobs");

    ws.current.onmessage = (event) => {
      console.log("🔔 New job update received:", event.data);
      fetchJobs(); // ✅ Fetch updated job list when new job is posted
    };

    return () => {
      if (ws.current) {
        ws.current.close();
      }
    };
  }, []);

  // ✅ Fetch Jobs from API
  const fetchJobs = async () => {
    try {
      const response = await axios.get(API_URL);
      console.log("Jobs:", response.data);
      setJobs(response.data); // ✅ Fix: Set job listings
      setLoading(false); // ✅ Stop loading after data fetch
    } catch (error) {
      console.error("❌ Error fetching jobs:", error);
    }
  };

  // ✅ Handle Job Posting
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post(API_URL, { title, description });
      alert("✅ Job Posted Successfully!");
      setTitle("");
      setDescription("");
      fetchJobs(); // ✅ Refresh Job Listings After Posting
    } catch (error) {
      console.error("❌ Error posting job:", error);
      alert("❌ Failed to post job. Check console.");
    }
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-r from-blue-500 to-purple-500 p-6">
      
      {/* ✅ Job Posting Form */}
      <div ref={formRef} className="bg-white p-8 rounded-lg shadow-lg w-96 mb-6">
        <h2 className="text-3xl font-bold text-center text-blue-600 mb-4">🚀 Post a Job</h2>
        <p className="text-center text-gray-500 mb-4">Find the best freelancer for your job!</p>
        <form onSubmit={handleSubmit}>
          <input
            type="text"
            placeholder="Job Title"
            className="w-full p-3 mb-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            required
          />
          <textarea
            placeholder="Job Description"
            className="w-full p-3 mb-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400"
            value={description}
            onChange={(e) => setDescription(e.target.value)}
            required
          ></textarea>
          <button
            type="submit"
            className="w-full bg-blue-600 text-white py-3 rounded-lg shadow-md hover:bg-blue-700 transition-all"
          >
            ✅ Post Job
          </button>
        </form>
      </div>

      {/* ✅ Job Listings Section */}
      <div className="bg-white p-6 rounded-lg shadow-lg w-96">
        <h2 className="text-2xl font-bold text-blue-600 mb-4">📋 Job Listings</h2>
        {loading ? (
          <p className="text-gray-500">⏳ Loading jobs...</p>
        ) : jobs.length === 0 ? (
          <p className="text-gray-500">No jobs posted yet.</p>
        ) : (
          <ul className="divide-y">
            {jobs.map((job) => (
              <li key={job.id} className="p-3">
                <h3 className="font-semibold text-lg">{job.title}</h3>
                <p className="text-gray-600">{job.description}</p>
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
}

import { useEffect, useRef } from "react";
import Link from "next/link";
import gsap from "gsap";

export default function Navbar() {
  const navRef = useRef(null);

  useEffect(() => {
    gsap.fromTo(
      navRef.current,
      { y: -50, opacity: 0 },
      { y: 0, opacity: 1, duration: 0.8 }
    );
  }, []);

  return (
    <nav ref={navRef} className="bg-white shadow-md py-4 fixed top-0 w-full z-50">
      <div className="container mx-auto flex justify-between items-center">
        <Link href="/" className="text-2xl font-bold text-blue-600">XNL Freelance</Link>
        <div className="space-x-6 text-lg">
          <Link href="/" className="text-gray-600 hover:text-blue-600 transition">Home</Link>
          <Link href="/jobs" className="text-gray-600 hover:text-blue-600 transition">Jobs</Link>
          <Link href="/profile" className="text-gray-600 hover:text-blue-600 transition">Profile</Link>
        </div>
      </div>
    </nav>
  );
}

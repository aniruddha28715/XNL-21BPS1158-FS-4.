import "@/styles/globals.css";  // ✅ Import global CSS here
import Navbar from "../components/Navbar";  // ✅ Import Navbar

export default function App({ Component, pageProps }) {
  return (
    <>
      <Navbar />
      <Component {...pageProps} />
    </>
  );
}

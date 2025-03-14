import { render, screen } from "@testing-library/react";
import Navbar from "../components/Navbar";

test("renders the navbar", () => {
  render(<Navbar />);
  expect(screen.getByText(/XNL Freelance/i)).toBeInTheDocument();

});

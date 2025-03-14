import { render, screen } from "@testing-library/react";
import JobCard from "../JobCard";

test("renders job title and description", () => {
  render(<JobCard title="Frontend Developer" description="React.js Expert Needed" />);
  
  expect(screen.getByText(/Frontend Developer/i)).toBeInTheDocument();
  expect(screen.getByText(/React.js Expert Needed/i)).toBeInTheDocument();
});

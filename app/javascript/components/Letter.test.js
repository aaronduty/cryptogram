import React from "react";
import { render } from "@testing-library/react";
import Letter from "./Letter";

test("Letter component renders without crashing", () => {
  render(<Letter id="0" character="T" />);
});

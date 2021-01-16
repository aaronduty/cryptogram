import React from "react";
import { render, screen } from "@testing-library/react";
import Word from "./Word";

test("Word component renders without crashing", () => {
  render(<Word id="1" text="TEST" />);
  debugger;
});

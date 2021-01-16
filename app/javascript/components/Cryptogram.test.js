import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom/extend-expect";
import Cryptogram from "./Cryptogram";

test("Cryptogram component renders without crashing", () => {
  render(<Cryptogram text="TEST AND TEST SOME MORE" />);
});

test("Changing one input changes all inputs for that letter", () => {
  render(<Cryptogram text="TEST AND TEST SOME MORE" />);
  let inputs = screen.queryAllByLabelText("T");
  fireEvent.change(inputs[0], { target: { value: "X" } });
  inputs.forEach((input) => {
    expect(input).toHaveValue("X");
  });
});

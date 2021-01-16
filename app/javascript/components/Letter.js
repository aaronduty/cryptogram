import React from "react";

import styles from "./styles/Letter.module.css";

export default function Letter({ id, character }) {
  return (
    <div className={styles.Letter}>
      <label htmlFor={`${id}-${character}-letter-input`}>{character}</label>
      <div>
        <input
          id={`${id}-${character}-letter-input`}
          name={`${id}-${character}-letter-input`}
          type="text"
          onChange={onChange}
          maxLength="1"
        />
      </div>
    </div>
  );
}

function onChange(event) {
  event.target.value = event.target.value.toUpperCase();
  const letter = event.target.name.split("-")[1];
  const matches = document.querySelectorAll(`[name$='-${letter}-letter-input']`);
  matches.forEach((element) => {
    element.setAttribute("value", event.target.value);
  });
}

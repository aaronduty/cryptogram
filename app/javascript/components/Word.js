import React from "react";
import Letter from "./Letter";

import styles from "./styles/Word.module.css";

export default function Word({ id, text }) {
  return (
    <div className={styles.Word}>
      {text.split("").map((character, index) => (
        <Letter key={`${id}letter${index}`} id={`${id}letter${index}`} character={character} />
      ))}
      &nbsp;
    </div>
  );
}

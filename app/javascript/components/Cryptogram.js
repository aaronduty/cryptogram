import React from "react";
import Word from "./Word";

import styles from "./styles/Cryptogram.module.css";

export default function Cryptogram({ text }) {
  let words = text.split(" ").map((word, index) => (
    <Word key={`word${index}`} id={`word${index}`} text={word} />
  ));
  return (
    <div className={styles.Cryptogram}>
      {words}
    </div>
  );
}

export class Crypto {
  // Takes a string of text to be stored as the "original" text
  // A modified version is stored as plaintext for encoding, with no
  //  leading/trailing spaces, lower case, letters and numbers only
  constructor(text) {
    this.orig = text;
    this.plain = text.trim().toLowerCase().replace(/\W/g, ''); // normalize it
  }
  get ciphertext() {
    // Helper variables:
    //  L: Square root of length (used to figure out rows/cols)
    //  R: Rows (round L to nearest whole number)
    //  C: Columns (round L up to highest whole number)
    //  P: this.plain with spaces to pad the length to an even rectangle
    let L = Math.sqrt(this.plain.length);   // square root of normalized text
    let R = Math.round(L, 0);               // round off
    let C = Math.ceil(L);                   // get ceiling - WHY?
    let P = this.plain.padEnd(R * C, ' ');  // adds padding to normalized text
    return [...Array(C)]
      .map((_, i) => [...P]
        .filter((_, pi) => pi % C === i)
        .join(''))
      .join(' ');
    // Creates an array of size C
    // For each index of the array (i.e. 0..C-1):
    //  Filter the characters from P where char's index % C is equal to the 0..C-1 index
    //  Join these together into a string: each one represents "reading down" the rectangle
    // Join all of these together with spaces for the final encrypted version of the text
    /*
        create an array of size c
    */
  }
}

[...Array(3)]


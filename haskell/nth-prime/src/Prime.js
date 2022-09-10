

var MAX_SIZE = 1000005;

// Function to generate N prime numbers using
// Sieve of Eratosthenes
function SieveOfEratosthenes(primes) {
  // Create a boolean array
  // "IsPrime[0..MAX_SIZE]" and
  // initialize all entries it as true.
  // A value in
  // IsPrime[i] will finally be false if i is
  // Not a IsPrime, else true.
  var IsPrime = Array(MAX_SIZE).fill(true);

  var p, i;
  for (p = 2; p * p < MAX_SIZE; p++) {
    // If IsPrime[p] is not changed,
    // then it is a prime
    if (IsPrime[p] == true) {
      // Update all multiples of p
      // greater than or
      // equal to the square of it
      // numbers which are multiple
      // of p and are
      // less than p^2 are already
      // been marked.
      for (i = p * p; i < MAX_SIZE; i += p)
        IsPrime[i] = false;
    }
  }

  // Store all prime numbers
  for (p = 2; p < MAX_SIZE; p++)
    if (IsPrime[p]) {
      primes.push(p);
    }

}

// Driver Code
// To store all prime numbers
var primes = [];

// Function call
SieveOfEratosthenes(primes);

  // document.write(
  // "5th prime number is "+primes[4]+"<br>"
  //   );
  //   document.write(
  //   "16th prime number is "+primes[15]+"<br>"
  //     );
  //     document.write(
  //     "1049th prime number is "+primes[1048]+"<br>"
  //       );


# RandomNumberGenerator

Random number generator `Trait`.

The required method is `nextRandomFloat`,
which must provide the next random number in the half-open range `zero` to `one`.

The provided methods are:

- `randomBit`: bit
- `randomBoolean`: boolean
- `randomByteArray`: byte array
- `randomComplex`: complex number
- `randomCycle`: cycle
- `randomInteger`: small integer
- `randomLargeInteger`: large integer
- `randomPermutation`: permutation
- `randomPermutationList`: permutation
- `randomPoint`: point
- `randomPrime`: prime
- `randomReal`: real number
- `randomSubsequence`: subsequence
- `randomWeightedChoice`: biased choice

`RandomNumberGenerator` implements `next` as `nextRandomFloat`:

- _next(r)_ ≡ _nextRandomFloat(r)_

* * *

See also: Iterator, randomComplex, randomChoice, randomInteger, randomLargeInteger, randomReal, randomWeightedChoice, Sfc32, Stream

Guides: Random Number Generators

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/randstream.html)

Further Reading: L’Ecuyer 2007

Categories: Random

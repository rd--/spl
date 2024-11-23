# RandomNumberGenerator

Random number generator `Trait`.

The required method is `nextRandomFloat`,
which must provide the next random number in the half-open range zero to one.

The provided methods are:

- `randomComplex`: random complex number
- `randomChoice`: random choice
- `randomInteger`: random small integer
- `randomLargeInteger`: random large integer
- `randomReal`: random real number
- `randomWeightedChoice`: random weighted choice

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

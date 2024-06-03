# RandomNumberGenerator

Random number generator `Trait`.

The required method is `nextRandomFloat`,
which must provide the next random number in the half-open range zero to one.

The provided methods are:

- `randomComplex`: random complex number
- `randomChoice`: random choice
- `randomFloat`: random real number
- `randomInteger`: random small integer
- `randomLargeInteger`: random large integer
- `randomWeightedChoice`: random weighted choice

`Random` implements `next` as `nextRandomFloat`:

- _next(r)_ ≡ _nextRandomFloat(r)_

* * *

See also: Iterator, Sfc32, Stream

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/randstream.html)

Further Reading: L’Ecuyer 2007

# Random

Random number generator `Trait`.

The required method is `nextRandomFloat`,
which must provide the next random number in the half-open range zero to one.

The provided methods are:

- _nextRandomFloat(aRandom, lowerBound, upperBound)_
- _nextRandomInteger(aRandom, lowerBound, upperBound)_

The implicit lower bounds are `zero` for floating point and `one` for integer:

- _nextRandomFloat(r, z)_ ≡ - _nextRandomFloat(r, 0, z)_
- _nextRandomInteger(r, z)_ = _nextRandomInteger(r, 1, z)_

Random implements `next` as `nextRandomFloat`:

- _next(r)_ ≡ _nextRandomFloat(r)_

* * *

See also: Iterator, Sfc32, Stream

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/randstream.html)

Further Reading: L’Ecuyer 2007

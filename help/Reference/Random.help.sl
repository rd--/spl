# Random -- random number generator trait

The required method is _nextRandomFloat(aRandom)_, which must provide the next random number in the half-open range zero to one.

The provided methods are:

- _nextRandomFloat(aRandom, lowerBound, upperBound)_
- _nextRandomInteger(aRandom, lowerBound, upperBound)_

The implicit lower bounds are zero for floating point and one for integer:

- _nextRandomFloat(r, z)_ ≡ - _nextRandomFloat(r, 0, z)_
- _nextRandomInteger(r, z)_ = _nextRandomInteger(r, 1, z)_

Random implements _next_ as _nextRandomFloat_:

- _next(r)_ ≡ _nextRandomFloat(r)_

* * *

See also: Iterator, Sfc32, Stream

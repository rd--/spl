# Random -- random number generator trait and type

The required method is _randomFloat(aRandom)_, which must provide the next random number in the half-open range zero to one.

The provided methods are:

- _next(aRandom)_ ≡ _randomFloat(aRandom)_
- _randomFloat(aRandom, upperBound)_
- _randomFloat(aRandom, lowerBound, upperBound)_
- _randomInteger(aRandom, upperBound)_
- _randomInteger(aRandom, lowerBound, upperBound)_

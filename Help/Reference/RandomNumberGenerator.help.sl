# RandomNumberGenerator

`RandomNumberGenerator` is a `Trait`.

```
>>> system
>>> .traitDictionary['RandomNumberGenerator']
>>> .isTrait
true
```

Types implementing `RandomNumberGenerator`:

```
>>> system
>>> .traitTypes('RandomNumberGenerator')
>>> .sort
[
	'LinearCongruential'
	'MersenneTwister'
	'Sfc32'
	'SplitMix'
	'System'
]
```

The required method is `nextRandomFloat`,
which must provide the next random number in the half-open range `zero` to `one`.

The provided methods are:

- `randomBit`
- `randomBoolean`
- `randomByteArray`
- `randomComplex`
- `randomCycle`
- `randomInteger`
- `randomLargeInteger`
- `randomPermutation`
- `randomPermutationList`
- `randomPoint`
- `randomPrime`
- `randomReal`
- `randomSubsequence`
- `randomWeightedChoice`

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

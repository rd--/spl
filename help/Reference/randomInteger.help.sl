# randomInteger

- _randomInteger(r, α)_ ⇒ _randomInteger(r, 1, α)_
- _randomInteger(r, min, max)_
- _randomInteger(r, min, max, shape)_

Random number generator.
Generate a random integer between _min_ and _max_.

Generate a random integer betwee one and nine, inclusive:

```
>>> Sfc32(79143).randomInteger(9)
5
```

Generate a random integer between 3 and 11, inclusive:

```
>>> Sfc32(79143).randomInteger(3, 11)
7
```

The ternary form answers a list or array of _shape_ random numbers.

A `List` of 13 random integers:

```
>>> Sfc32(76941).randomInteger(1, 9, 13)
[4 1 3 5 4 2 6 4 9 1 3 8 4]
```

A 3×4 matrix of random integers:

```
>>> Sfc32(49825).randomInteger(1, 9, [3 4])
[
	5 8 5 7;
	8 3 7 4;
	2 6 8 1
]
```

* * *

See also: atRandom, randomByteArray, randomFloat, randomLargeInteger, randomSample

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomInteger.html)

Categories: Random

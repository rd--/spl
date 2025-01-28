# randomComplex

- _randomComplex(r, min, max, shape)_

Answer an array of the indicated _shape_ containing pseudo-random `Complex` numbers
that lie inside the rectangle with corners given by _min_ and _max_.

A 3×4 matrix of random complex numbers in the rectangle with corners at _10J10_ and _100J100_:

```
>>> Sfc32(2166136261)
>>> .randomComplex(
>>> 	10J10,
>>> 	100J100,
>>> 	[3 4]
>>> )
[
	21.2939J65.7937   33.3826J97.8457
	78.3980J66.3211   71.3774J93.8346
	;
	79.2909J67.2678   57.8418J13.1994
	92.4074J99.9789   54.5949J55.6812
	;
	10.4145J96.3295   66.2567J27.4153
	86.3876J85.7785   40.6106J82.1217
]
```

`randomComplex` generates a uniform distribution, here with mean _0.5J0.5_:

```
>>> Sfc32(2166136261)
>>> .randomComplex(0J0, 1J1, [1000])
>>> .mean
0.52112J0.49406
```

* * *

See also: Complex, randomInteger, randomLargeInteger, RandomNumberGenerator, randomReal, seedRandom

Guides: Random Number Generators

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomComplex.html)

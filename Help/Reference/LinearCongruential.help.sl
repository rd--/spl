# LinearCongruential

- _LinearCongruential([a c m], s)_

Answer a pseudo random number generator with with multiplier _a_, increment _c_, modulus _m_ and seed _s_.

`LinearCongruential` implements `RandomNumberGenerator` and `Stream`:

```
>>> let rng = LinearCongruential([1 2 3], 4);
>>> (
>>> 	rng.isLinearCongruential,
>>> 	rng.isRandomNumberGenerator,
>>> 	rng.isStream
>>> )
(true, true, true)
```

The first four states given parameters for the Knuth MMIX generator:

```
>>> let m = 2L ^ 64;
>>> let a = 6364136223846793005L;
>>> let c = 1442695040888963407L;
>>> let r = LinearCongruential([a c m], 1);
>>> { r.nextState } ! 4
[
	 7806831264735756412L
	 9396908728118811419L
	11960119808228829710L
	 7062582979898595269L
]
```

The first three random numbers given the seed _12345_:

```
>>> let s = 12345;
>>> numericalRecipesLinearCongruential(s)
>>> .next(3)
[0.15776 0.86476 0.89335]
```

The first few internal state values,
OEIS [A385459](https://oeis.org/A385459):

```
>>> let r = numericalRecipesLinearCongruential(1);
>>> { r.nextState } ! 35
[
	33450 104855  85336 132861  49430
	53491 121572  91961  63874  65679
	65264 135925  31278  82091   9148
	84465 115226 122887  11400 137453
	76678  18147 121556  29929  30834
	40319   2080 115557   6494  12571
	58476 132833  80842  65655 112184
]
```

Plot random floating point numbers between `zero` and `one`:

~~~spl svg=A
numericalRecipesLinearCongruential(98765)
.next(99)
.linePlot
~~~

![](sw/spl/Help/Image/LinearCongruential-A.svg)

Plot histogram:

~~~spl svg=B
numericalRecipesLinearCongruential(387912)
.next(10 ^ 4)
.histogramPlot
~~~

![](sw/spl/Help/Image/LinearCongruential-B.svg)

Difference between empirical and expected mean and standard deviation:

```
>>> let r = numericalRecipesLinearCongruential(387912);
>>> let n = r.next(10 ^ 4);
>>> (
>>> 	0.5 - n.mean,
>>> 	1/12.sqrt - n.standardDeviation
>>> )
(-0.002115, -0.002121)
```

* * *

See also: MersenneTwister, RandomNumberGenerator, Sfc32, SplitMix, Stream

Guides: Random Number Generators

References:
_W_
[1](https://en.wikipedia.org/wiki/Linear_congruential_generator)

Further Reading: Thomson 1958

Categories: Random

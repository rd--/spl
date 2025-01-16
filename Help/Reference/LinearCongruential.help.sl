# LinearCongruential

- _LinearCongruential(anInteger)_

Answer a pseudo random number generator seeded with _anInteger_.

`LinearCongruential` implements `RandomNumberGenerator` and `Stream`:

```
>>> let rng = LinearCongruential(12345);
>>> (
>>> 	rng.isLinearCongruential,
>>> 	rng.isRandomNumberGenerator,
>>> 	rng.isStream
>>> )
(true, true, true)
```

The first three random numbers given the seed _12345_:

```
>>> LinearCongruential(12345).next(3)
[0.15776 0.86476 0.89335]
```

Plot random floating point numbers between `zero` and `one`:

~~~spl svg=A
LinearCongruential(98765)
.next(99)
.linePlot
~~~

![](sw/spl/Help/Image/LinearCongruential-A.svg)

* * *

See also: MersenneTwister, RandomNumberGenerator, Sfc32, SplitMix, Stream

References:
_W_
[1](https://en.wikipedia.org/wiki/Linear_congruential_generator)

Further Reading: Thomson 1958

Categories: Random

# randomFloat

- _randomFloat(r, alpha)_ => _randomFloat(0, alpha)_
- _randomFloat(r, min, max)_
- _randomFloat(r, min, max, countOrShape)_

Answer one or more random numbers between _min_ and _max_ using the random number generator _r_.

Uniform distribution, uni-polar:

```
>>> Sfc32(1684).randomFloat(1)
0.6949
```

Uniform distribution, bi-polar:

```
>>> Sfc32(19442).randomFloat(-1, 1)
-0.7021
```

A `List` of five random numbers:

```
>>> Sfc32(37194).randomFloat(-1, 1, 5)
[0.2422 0.8461 -0.4622 -0.9531 0.4011]
```

A 3×4 matrix of random numbers:

```
>>> Sfc32(73198).randomFloat(-1, 1, [3 4])
[
	-0.83962 -0.72375 -0.67470 -0.03642;
	-0.62561 -0.33655  0.32850 -0.81299;
	 0.19075 -0.80027 -0.52768  0.43139
]
```

Plot, uniform distribution:

~~~
system.randomFloat(-1, 1, 99).plot
~~~

Plot a random walk:

~~~
system.randomFloat(-1, 1, 99).accumulate.plot
~~~

* * *

See also: atRandom, nextRandomFloat, randomInteger, Random, System

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomReal.html)

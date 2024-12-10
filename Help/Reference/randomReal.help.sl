# randomReal

- _randomReal(r, min, max, shape)_

Answer an array of the indicated _shape_ containing random real numbers between _min_ and _max_.

Uniform distribution, uni-polar:

```
>>> Sfc32(1684).randomReal(0, 1, [])
0.6949
```

Uniform distribution, bi-polar:

```
>>> Sfc32(19442).randomReal(-1, 1, [])
-0.7021
```

A vector of five random numbers:

```
>>> Sfc32(37194).randomReal(-1, 1, [5])
[0.2422 0.8461 -0.4622 -0.9531 0.4011]
```

A 3×4 matrix of random numbers:

```
>>> Sfc32(73198).randomReal(-1, 1, [3 4])
[
	-0.83962 -0.72375 -0.67470 -0.03642;
	-0.62561 -0.33655  0.32850 -0.81299;
	 0.19075 -0.80027 -0.52768  0.43139
]
```

Plot, uniform distribution:

~~~
Sfc32(67183)
.randomReal(-1, 1, [99])
.linePlot
~~~

![](sw/spl/Help/Image/randomReal-A.svg)

Plot a random walk:

~~~
Sfc32(678314)
.randomReal(-1, 1, [99])
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/randomReal-B.svg)

* * *

See also: atRandom, nextRandomFloat, RandomNumberGenerator, randomChoice, randomComplex, randomInteger, randomPoint, randomVariate, System

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomReal.html)

Categories: Random

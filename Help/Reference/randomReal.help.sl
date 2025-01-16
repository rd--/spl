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

~~~spl svg=A
Sfc32(67183)
.randomReal(-1, 1, [99])
.linePlot
~~~

![](sw/spl/Help/Image/randomReal-A.svg)

Plot a random walk:

~~~spl svg=B
Sfc32(678314)
.randomReal(-1, 1, [99])
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/randomReal-B.svg)

A `matrixPlot` of a random 13×11 _(-1, 1)_ matrix:

~~~spl svg=C
Sfc32(329149)
.randomReal(-1, 1, [13 11])
.matrixPlot
~~~

![](sw/spl/Help/Image/randomReal-C.svg)

A `Greymap` of a random 50×90 _(0, 1)_ matrix:

~~~spl png=D
Sfc32(814789)
.randomReal(0, 1, [50 90])
.Graymap
~~~

![](sw/spl/Help/Image/randomReal-D.png)

* * *

See also: atRandom, nextRandomFloat, RandomNumberGenerator, randomChoice, randomComplex, randomInteger, randomPoint, randomVariate, System

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomReal.html)

Categories: Random

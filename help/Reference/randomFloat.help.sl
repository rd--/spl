# randomFloat

- _randomFloat(alpha)_ => _randomFloat(0, alpha)_
- _randomFloat(min, max)_
- _randomFloat(min, max, countOrShape)_

Generate a random number between _low_ and _high_.

Uniform distribution, uni-polar:

```
>>> 1.randomFloat.betweenAnd(0, 1)
true
```

Uniform distribution, bi-polar:

```
>>> -1.randomFloat(1).betweenAnd(-1, 1)
true
```

A List of random numbers:

```
>>> -1.randomFloat(1, 9).allSatisfy { :each | each.betweenAnd(-1, 1) }
true
```

A 3×4 matrix of random numbers:

```
>>> -1.randomFloat(1, [3 4]).allSatisfy { :each | each.sum.betweenAnd(-1 * 4, 1 * 4) }
true
```

Plot:

~~~
-1.randomFloat(1, 99).plot
~~~

A random walk:

~~~
-1.randomFloat(1, 99).accumulate.plot
~~~

* * *

See also: atRandom, nextRandomFloat, randomInteger, Random, System

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomReal.html)

# minkowskiQuestionMark

- _minkowskiQuestionMark(aNumber)_

Answer Minkowski’s question mark function.

At a quadratic irrational number:

```
>>> ((3.sqrt - 1) / 2)
>>> .minkowskiQuestionMark
2/7
```

At `SmallFloat`:

```
>>> 0.123456.minkowskiQuestionMark
0.00780487

>>> (1 + 5.sqrt / 7)
>>> .minkowskiQuestionMark
11822865281537472
/
24019198012642645

>>> 1.pi.minkowskiQuestionMark
3.015624761581421

>>> (13.sqrt - 7 / 6)
>>> .minkowskiQuestionMark
-5/9
```

At `Integer`:

```
>>> 1.minkowskiQuestionMark
1

>>> 2.minkowskiQuestionMark
2
```

At `goldenRatio`:

```
>>> 1.goldenRatio
>>> .minkowskiQuestionMark
5/3

>>> (1.goldenRatio - 1)
>>> .minkowskiQuestionMark
2/3
```

Threads over lists:

```
>>> [0 0.5 2.sqrt]
>>> .minkowskiQuestionMark
[0 0.5 7/5]

>>> ([1 2] / 3)
>>> .minkowskiQuestionMark
[1/4 3/4]

>>> [2.sqrt / 2, 3.sqrt / 2]
>>> .minkowskiQuestionMark
[4/5 84/85]
```

The question-mark function is continuous and monotonically increasing, so it has an inverse:

```
>>> (7 / 5)
>>> .minkowskiQuestionMarkInverse
2.sqrt

>>> (5 / 3)
>>> .minkowskiQuestionMarkInverse
1.goldenRatio

>>> 3.015624761581421
>>> .minkowskiQuestionMarkInverse
1.pi

>>> (1 / 4)
>>> .minkowskiQuestionMarkInverse
1/3
```

The question-mark function has fixed points at 0, 1/2 and 1, and at least two more,
symmetric about the midpoint,
one at approximately 0.42037,
c.f. OEIS [A048819](https://oeis.org/A048819):

```
>>> [0 0.5 1 0.420372339423223]
>>> .minkowskiQuestionMark
[0 0.5 1 0.4203723394232]
```

Plot over the unit interval:

~~~spl svg=A
(0 -- 1).functionPlot(
	minkowskiQuestionMark:/1
)
~~~

![](sw/spl/Help/Image/minkowskiQuestionMark-A.svg)

Plot difference from input:

~~~spl svg=B
(0 -- 2).functionPlot { :x |
	x.minkowskiQuestionMark - x
}
~~~

![](sw/spl/Help/Image/minkowskiQuestionMark-B.svg)

Plot from -2 to 2, _?(x)_ is surjective:

~~~spl svg=C
(-2 -- 2).functionPlot(
	minkowskiQuestionMark:/1
)
~~~

![](sw/spl/Help/Image/minkowskiQuestionMark-C.svg)

* * *

See also: continuedFraction, minkowskiQuestionMarkInverse, sternBrocotTree

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MinkowskisQuestionMarkFunction.html)
[2](https://reference.wolfram.com/language/ref/MinkowskiQuestionMark.html),
_OEIS_
[1](https://oeis.org/A048819),
_W_
[1](https://en.wikipedia.org/wiki/Minkowski%27s_question-mark_function)

Categories: Math, Function

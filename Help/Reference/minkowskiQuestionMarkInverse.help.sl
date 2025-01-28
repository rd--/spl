# minkowskiQuestionMarkInverse

- _minkowskiQuestionMarkInverse(aNumber)_

The inverse of Minkowski’s question mark function.

The question-mark function is continuous and monotonically increasing, so it has an inverse:

```
>>> [
>>> 	7 / 5, 5 / 3, 3.015624761581421, 1 / 4
>>> ].minkowskiQuestionMarkInverse
[2.sqrt 1.goldenRatio 1.pi 1/3]
```

Plot over the unit interval:

~~~spl svg=A
(0 -- 1).functionPlot(
	minkowskiQuestionMarkInverse:/1
)
~~~

![](sw/spl/Help/Image/minkowskiQuestionMarkInverse-A.svg)

Plot difference from input:

~~~spl svg=B
(0 -- 2).functionPlot { :x |
	let y = x.minkowskiQuestionMarkInverse;
	y - x
}
~~~

![](sw/spl/Help/Image/minkowskiQuestionMarkInverse-B.svg)

Plot from -2 to 2:

~~~spl svg=C
(-2 -- 2).functionPlot(
	minkowskiQuestionMarkInverse:/1
)
~~~

![](sw/spl/Help/Image/minkowskiQuestionMarkInverse-C.svg)

* * *

See also: continuedFraction, minkowskiQuestionMark

Categories: Math, Function

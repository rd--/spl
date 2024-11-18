# minkowskiQuestionMarkInverse

- _minkowskiQuestionMarkInverse(aNumber)_

The inverse of Minkowski’s question mark function.

The question-mark function is continuous and monotonically increasing, so it has an inverse:

```
>>> [7 / 5, 5 / 3, 3.015624761581421, 1 / 4].minkowskiQuestionMarkInverse
[2.sqrt 1.goldenRatio pi 1/3]
```

Plot over the unit interval:

~~~
(0 -- 1).functionPlot(minkowskiQuestionMarkInverse:/1)
~~~

Plot difference from input:

~~~
(0 -- 2).functionPlot { :x | x.minkowskiQuestionMarkInverse - x }
~~~

Plot from -2 to 2:

~~~
(-2 -- 2).functionPlot(minkowskiQuestionMarkInverse:/1)
~~~

* * *

See also: continuedFraction, minkowskiQuestionMark

Categories: Math

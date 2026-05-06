# isPositive

- _isPositive(x)_

Answer `true` if the number _x_ is greater than `zero`.

Evaluate at different types of numbers,
threads over lists:

```
>>> [1.6 3/4 1.pi 0 -5].isPositive
[true true true false false]
```

The product of the nonzero digits of _n_ written in base nine,
OEIS [A338882](https://oeis.org/A338882):

~~~spl png=A oeis=A338882
0:1200.collect { :n |
	n.integerDigits(9)
	.select(isPositive:/1)
	.product
}.denseScatterPlot
~~~

![](Help/Image/isPositive-A.png)

* * *

See also: isNegative, isNonNegative

Guides: Number Functions, Predicate Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Positive.html),
_Smalltalk_
5.6.2.36

Categories: Math, Testing

# divisorSum

- _divisorSum(n, f:/1)_

The sum of _f_ at all _i_ that divide the integer _n_.

Find the sum of the divisors of thirty, c.f. `divisorSigma`:

```
>>> 30.divisorSum(identity:/1)
72

>>> 1.divisorSigma(30)
72
```

Plot the sum of divisors for the first 50 numbers:

~~~spl svg=A
1:50.functionPlot { :n |
	n.divisorSum(identity:/1)
}
~~~

![](sw/spl/Help/Image/divisorSum-A.svg)

Generalized sum of divisors function,
OEIS [A002129](https://oeis.org/A002129):

~~~spl svg=B
1:150.collect { :n |
	n.divisorSum { :x |
		0 - (-1 ^ x * x)
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSum-B.svg)

* * *

See also: aliquotSum, divisors, divisorSigma, sum

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DivisorSum.html)

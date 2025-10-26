# tribonacciConstant

- _tribonacciConstant(n)_

Answer _n_ times the tribonacci constant.

```
>>> let t = 1.tribonacciConstant;
>>> (t, t + (t ^ -3))
(1.8393, 2)
```

The tribonacci constant is also stored as a named constant with higher precision,
OEIS [A058265](https://oeis.org/A058265):

```
>>> let n = 'TribonacciConstant';
>>> let k = n.namedConstant;
>>> (k.asFloat, k.scale)
(1.839287, 101)
```

Scatter plot of the digits of the tribonacci constant:

~~~spl svg=A
'TribonacciConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/tribonacciConstant-A.svg)

* * *

See also: namedConstant, tetranacciConstant, tribonacciNumber, tribonacciWord

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TribonacciConstant.html),
_OEIS_
[1](https://oeis.org/A058265)

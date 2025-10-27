# tetranacciConstant

- _tetranacciConstant(n)_

Answer _n_ times the tetranacci constant.

```
>>> let t = 1.tetranacciConstant;
>>> (t, t + (t ^ -4))
(1.927562, 2)
```

The tetranacci constant is also stored as a named constant with higher precision,
OEIS [A086088](https://oeis.org/A086088):

```
>>> let n = 'TetranacciConstant';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(1.927562, 101)
```

Scatter plot of the digits of the tetranacci constant:

~~~spl svg=A
'TetranacciConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/tetranacciConstant-A.svg)

* * *

See also: linearRecurrence, namedConstant, tribonacciConstant

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TetranacciConstant.html),
_OEIS_
[1](https://oeis.org/A058265)

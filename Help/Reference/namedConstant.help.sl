# namedConstant

- _namedConstant(s)_

Answer a `Decimal` number representing the mathematical or physical constant named at the `String` _s_.

The tetranacci constant,
OEIS [A086088](https://oeis.org/A086088):

```
>>> let n = 'TetranacciConstant';
>>> let k = n.namedConstant;
>>> (k.asFloat, k.scale)
(1.927562, 101)
```

Scatter plot of the digits of the tetranacci constant:

~~~spl svg=A
'TetranacciConstant'
.namedConstant
.integerDigits
.scatterPlot
~~~

![](sw/spl/Help/Image/namedConstant-A.svg)

* * *

See also: Decimal

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TetranacciConstant.html),
_OEIS_
[1](https://oeis.org/A086088)

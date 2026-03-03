# mertensFunction

- _mertensFunction(n)_

Answer the Mertens function
also called Mertens’s function,
for the integer _n_.

The first few terms,
OEIS [A002321](https://oeis.org/A002321):

```
>>> 1:25.collect(mertensFunction:/1)
1:25.collect(moebiusMu:/1).prefixSum
```

Plot
OEIS [A002321](https://oeis.org/A002321):

~~~spl svg=A
1:100.collect(mertensFunction:/1)
.stepPlot
~~~

![](sw/spl/Help/Image/mertensFunction-A.svg)

* * *

See also: moebiusMu

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MertensFunction.html),
_OEIS_
[1](https://oeis.org/A002321)

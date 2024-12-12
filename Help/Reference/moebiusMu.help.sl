# moebiusMu

- _moebiusMu(aNumber)_

Answer the sum of the primitive _aNumber_-th roots of unity.

Compute the Möbius function at ten and eleven:

```
>>> 10.moebiusMu
1

>>> 11.moebiusMu
-1
```

`moebiusMu` is a multiplicative function:

```
>>> (11 * 23).moebiusMu
11.moebiusMu * 23.moebiusMu
```

Plot the Möbius sequence for the first 20 numbers:

~~~spl svg=A
1:20.collect(moebiusMu:/1).discretePlot
~~~

![](sw/spl/Help/Image/moebiusMu-A.svg)

* * *

See also: isSquareFree, liouvilleLambda

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MoebiusFunction.html)
[2](https://reference.wolfram.com/language/ref/MoebiusMu.html),
_OEIS_
[1](https://oeis.org/A008683)

Categories: Math

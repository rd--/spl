# moebiusMu

- _moebiusMu(n)_

Answer Möbius function _μ(n)_,
the sum of the primitive _n_-th roots of unity.

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

Mertens’s function _M(n)_ sums μ over _1:n_:

```
>>> 1:81
>>> .collect(moebiusMu:/1)
>>> .prefixSum
[
	 1  0 -1 -1 -2 -1 -2 -2 -2 -1
	-2 -2 -3 -2 -1 -1 -2 -2 -3 -3
	-2 -1 -2 -2 -2 -1 -1 -1 -2 -3
	-4 -4 -3 -2 -1 -1 -2 -1  0  0
	-1 -2 -3 -3 -3 -2 -3 -3 -3 -3
	-2 -2 -3 -3 -2 -2 -1  0 -1 -1
	-2 -1 -1 -1  0 -1 -2 -2 -1 -2
	-3 -3 -4 -3 -3 -3 -2 -3 -4 -4
	-4
]
```

Plot the first few terms of Mertens’s function:

~~~spl svg=B
1:250
.collect(moebiusMu:/1)
.prefixSum
.linePlot
~~~

![](sw/spl/Help/Image/moebiusMu-B.svg)

* * *

See also: isSquareFree, liouvilleLambda

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MoebiusFunction.html)
[2](https://mathworld.wolfram.com/MertensFunction.html)
[3](https://reference.wolfram.com/language/ref/MoebiusMu.html),
_OEIS_
[1](https://oeis.org/A008683)
[2](https://oeis.org/A002321),
_W_
[1](https://en.wikipedia.org/wiki/M%C3%B6bius_function)
[2](https://en.wikipedia.org/wiki/Mertens_function)

Unicode: U+03BC μ Greek Small Letter Mu

Categories: Math

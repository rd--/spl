# arithmeticGeometricMean

- _arithmeticGeometricMean(a, b)_

Answer the arithmetic-geometric mean.

```
>>> 24.arithmeticGeometricMean(6)
13.4582

>>> 1.8.arithmeticGeometricMean(1.2)
1.48481

>>> 1.2.arithmeticGeometricMean(5)
2.76517

>>> 52.arithmeticGeometricMean(5)
21.87248362674175

>>> arithmeticGeometricMean:/2
>>> .table([16 8], [4 10])
[8.97211 12.824; 5.82716 8.97211]

>>> arithmeticGeometricMean(0, 0)
0
```

At `Complex`:

```
>>> 1J1.arithmeticGeometricMean(3J1)
1.89938J1.05741
```

The `reciprocal` of the arithmetic–geometric mean of `one` and the square root of 2 is Gauss’s constant.

```
>>> 1 / 1.arithmeticGeometricMean(2.sqrt)
0.8346268

>>> 1.gausssConstant
0.8346268

>>> beta(0.25, 0.5) / 2.pi
0.8346268
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	1.arithmeticGeometricMean(x)
}
~~~

![](sw/spl/Help/Image/arithmeticGeometricMean-A.svg)

Plot table of means:

~~~spl svg=B
let i = [0, 0.25 .. 2];
arithmeticGeometricMean:/2
.table(i, i).matrixPlot
~~~

![](sw/spl/Help/Image/arithmeticGeometricMean-B.svg)

Special values: OEIS A068521, A084895, A084896 & A084897:

```
>>> 1.arithmeticGeometricMean([2 3 4 5])
[
	1.4567910310469068
	1.8636167832449777
	2.2430285802876027
	2.6040081905309407
]
```

* * *

See also: arithmeticMean, arithmeticoGeometricSequence, ellipticK, geometricMean, mean, median, moment

Guides: Integer Sequences, Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Arithmetic-GeometricMean.html)
[2](https://mathworld.wolfram.com/GausssConstant.html)
[3](https://reference.wolfram.com/language/ref/ArithmeticGeometricMean.html),
_OEIS_
[1](https://oeis.org/A068521)
[2](https://oeis.org/A084895)
[3](https://oeis.org/A084896)
[4](https://oeis.org/A084897),
_W_
[1](https://en.wikipedia.org/wiki/Arithmetic%E2%80%93geometric_mean)

Categories: Statistics

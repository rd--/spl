# arithmeticGeometricMean

- _arithmeticGeometricMean(aNumber, anotherNumber)_

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

>>> [16 8] arithmeticGeometricMean.table [4 10]
[8.97211 12.824; 5.82716 8.97211]
```

At `Complex`:

```
>>> 1j1.arithmeticGeometricMean(3j1)
1.89938j1.05741
```

The `reciprocal` of the arithmetic–geometric mean of `one` and the square root of 2 is Gauss’s constant.

```
>>> 1 / 1.arithmeticGeometricMean(2.sqrt)
0.8346268
```

Plot over a subset of the reals:

~~~
(0 -- 1).functionPlot { :x | 1.arithmeticGeometricMean(x) }
~~~

Special values: OEIS A068521, A084895, A084896 & A084897:

```
>>> [1] arithmeticGeometricMean.each [2 3 4 5]
[1.4567910310469068 1.8636167832449777 2.2430285802876027 2.6040081905309407]
```

* * *

See also: arithmeticMean, geometricMean, mean, median, moment

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Arithmetic-GeometricMean.html)
[2](https://reference.wolfram.com/language/ref/ArithmeticGeometricMean.html)

Categories: Statistics

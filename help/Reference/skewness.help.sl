# skewness

- _skewness(aCollection)_

Answer the coefficient of skewness estimate for the elements in _aCollection_.

Skewness for a list of values:

```
>>> [1 4 3.5 9 7 8.2].skewness
-0.214156

>>> [1 3 7 4].skewness
(14 / (25 * 3.sqrt))
```

Skewness for a matrix gives columnwise skewness:

```
>>> [1 3 4; 4 6 1; 12 1 6].skewness
[0.49221 0.23906 -0.23906]
```

Find the skewness for the heights of children in a class.
Skewness close to 0 indicates distribution symmetric around the mean:

```
>>> [
>>> 	134 143 131 140 145 136 131 136 143
>>> 	136 133 145 147 150 150 146 137 143
>>> 	132 142 145 136 144 135 141
>>> ].skewness
0.0113408
```

* * *

See also: centralMoment, kurtosis

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Skewness.html)

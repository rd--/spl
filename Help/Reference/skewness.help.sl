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

Find the `skewness` for the heights of children in a class.
Skewness is the normalised third central moment.
A value close to `zero` indicates the distribution is symmetric around the mean:

```
>>> let h = [
>>> 	134 143 131 140 145 136 131 136 143
>>> 	136 133 145 147 150 150 146 137 143
>>> 	132 142 145 136 144 135 141
>>> ];
>>> (h.skewness, h.standardizedMoment(3))
(0.0113408, 0.0113408)
```

Skewness of random numbers:

```
>>> [
>>> 	0.5377 0.3188 3.5784
>>> 	1.8339 -1.3077 2.7694
>>> 	-2.2588 -0.4336 -1.3499
>>> 	0.8622 0.3426 3.0349
>>> 	0.7254 -0.1241 0.6715
>>> 	-0.0631 1.4897 -1.2075
>>> 	0.7147 1.4090 0.7172
>>> 	-0.2050 1.4172 1.6302
>>> ].skewness
0.09159
```

* * *

See also: centralMoment, kurtosis

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Skewness.html),
_Mathworks_
[1](https://mathworks.com/help/stats/skewness.html)

Categories: Statistics

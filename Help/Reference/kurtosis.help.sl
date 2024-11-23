# kurtosis

- _kurtosis(aCollection)_

Answer the coefficient of kurtosis estimate for the elements in _aCollection_.

Kurtosis for a list of values:

```
>>> [1 4 3.5 9 7 8.2].kurtosis
1.62921

>>> [1 3 7 4].kurtosis
(3607 / 1875)

>>> [pi e 2].kurtosis
(3 / 2)
```

Kurtosis for a matrix gives columnwise kurtosis:

```
>>> [1 3 4; 4 6 1; 12 1 6].kurtosis
[3/2 3/2 3/2]
```

Find the `kurtosis` for the heights of children in a class.
The kurtosis is the standardized fourth central moment.
Kurtosis larger than 3 would indicate a distribution highly concentrated around the mean:

```
>>> let h = [
>>> 	134 143 131 140 145 136 131 136 143
>>> 	136 133 145 147 150 150 146 137 143
>>> 	132 142 145 136 144 135 141
>>> ];
>>> (h.kurtosis, h.standardizedMoment(4))
(1.8248, 1.8248)
```

Find kurtosis of ten random numbers:

```
>>> [
>>> 	 0.5377  1.8339 -2.2588 0.8622 0.3188
>>> 	-1.3077 -0.4336  0.3426 3.5784 2.7694
>>> ].kurtosis
2.3121
```

* * *

See also: centralMoment, skewness

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Kurtosis.html),
_Mathworks_
[1](https://mathworks.com/help/stats/kurtosis.html)

Categories: Statistics

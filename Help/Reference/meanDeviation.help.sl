# meanDeviation

- _meanDeviation(aCollection)_

Answer the mean absolute deviation from the mean of the elements in _aCollection_.

```
>>> [1.21 3.4 2 4.66 1.5 5.61 7.22].meanDeviation
1.86245

>>> [1 4 5 2].meanDeviation
(3 / 2)

>>> [2 8 3 15].meanDeviation
(9 / 2)

>>> [2 2 3 4 14].meanDeviation
3.6
```

Specify the measure of central tendency:

```
>>> [2 2 3 4 14].meanDeviation(median:/1)
2.8

>>> [2 2 3 4 14]
>>> .meanDeviation { :x |
>>> 	x.commonest.first
>>> }
3
```

Calculation in terms of `-`, `mean`, `abs`, `sum`, `/` and `size`:

```
>>> let l = [2 4 4 4 5 5 7 9];
>>> ((l - l.mean).abs.sum / l.size, l.meanDeviation)
(12 / 8, 12 / 8)
```

* * *

See also: mean, standardDeviation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MeanDeviation.html)
[2](https://reference.wolfram.com/language/ref/MeanDeviation.html),
_W_
[1](https://en.wikipedia.org/wiki/Average_absolute_deviation)

Categories: Statistics

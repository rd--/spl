# winsorizedMean

- _winsorizedMean(aList, [f₁ f₂])_

Answer the `mean` when a fraction _f₁_ of the smallest elements and a fraction _f₂_ of the largest elements are replaced by the remaining extreme values.

Winsorized mean after removing extreme values:

```
>>> [-10 1 1 1 1 20]
>>> .winsorizedMean([0.2 0.2])
1

>>> [1 20 3 4].winsorizedMean([0.4 0.4])
7/2

>>> [2.sqrt, 1.e, 1.pi, 1.pi ^ 2, 1, 2, 3]
>>> .winsorizedMean([0.25 0.25])
[2.sqrt 2.sqrt 2 1.e 3 1.pi 1.pi].sum / 7

>>> [5 10 4 25 2 1].winsorizedMean([0.2 0.2])
5.5
```

Winsorized mean after removing the smallest extreme values:

```
>>> [-10 1 1 1 1 20].winsorizedMean([0.2 0])
25/6
```

Obtain a robust estimate of location when outliers are present:

```
>>> [1 5 2 6 10 1E5 5 4 -200 5]
>>> .winsorizedMean([0.1 0.1])
4.9
```

Extreme values have a large influence on the `mean`:

```
>>> [1 5 2 6 10 1E5 5 4 -200 5].mean
9983.8
```

* * *

See also: biweightLocation, mean, meanShiftFilter, median, quantile, trimmedMean, trimmedVariance, winsorizedVariance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WinsorizedMean.html),
_W_
[1](https://en.wikipedia.org/wiki/Winsorized_mean)

Categories: Statistics

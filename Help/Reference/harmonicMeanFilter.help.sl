# harmonicMeanFilter

- _harmonicMeanFilter(x, r)_

Filters _x_ by replacing every value by the harmonic mean value in its range-_r_ neighborhood.

Harmonic mean filtering of a list:

```
>>> [1 2 30 2 1].harmonicMeanFilter(1)
[4/3 45/23 90/31 45/23 4/3]
```

Apply a moving harmonic mean filter to a vector:

```
>>> [1 2 3 4 5].harmonicMeanFilter(1)
[4/3 18/11 36/13 180/47 40/9]
```

* * *

See also: convolve, harmonicMean, meanFilter

Guides: Filter Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HarmonicMeanFilter.html)

# harmonicMean

- _harmonicMean(aCollection)_

Answer the harmonic mean of the values in _aCollection_.

```
>>> [1 5 5 4].harmonicMean
80/33

>>> [2 10 2 8].harmonicMean
160/49

>>> 1:4.harmonicMean
48/25

>>> [1 4 4].harmonicMean
2
```

Harmonic mean of columns of a matrix:

```
>>> [1 2; 5 10; 5 2; 4 8].harmonicMean
[80/33 160/49]
```

Harmonic mean of the first thirty integers:

```
>>> 1:30.harmonicMean
7.5094
```

* * *

See also: geometricMean, mean

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HarmonicMean.html),
_Mathworks_
[1](https://mathworks.com/help/stats/harmmean.html),
_W_
[1](https://en.wikipedia.org/wiki/Harmonic_mean)

Categories: Statistics

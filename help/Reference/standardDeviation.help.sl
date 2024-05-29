# standardDeviation

- _standardDeviation(aCollection)_

The standard deviation is the square root of the `variance`.

```
>>> [1.21 3.4 2 4.66 1.5 5.61 7.22].standardDeviation
2.27183

>>> [5.2 5.3 5.4].standardDeviation
0.1

>>> [7 8 9].standardDeviation
1
```

Standard deviation at a matrix is column-wise:

```
>>> [1 0 4; 0 2 0; 0 0 3].standardDeviation
[1 / 3.sqrt, 2 / 3.sqrt, (13 / 3).sqrt]
```

* * *

See also: variance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StandardDeviation.html)
[2](https://reference.wolfram.com/language/ref/StandardDeviation.html)

Categories: Statistics

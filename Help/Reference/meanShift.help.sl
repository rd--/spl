# meanShift

- _meanShift(x, d)_
- _meanShift(x, d, m)_

Replaces each element in _x_ by the mean of the values of all elements that differ by less than _d_.
The distance function is `euclideanDistance`.

Mean shift of a list of integers:

```
>>> [0 10 1 11].meanShift(1)
[1/2 21/2 1/2 21/2]
```

Mean shift of a list of vectors:

```
>>> [0 1; 2 3; 10 11; 12 13].meanShift(3)
[1 2; 1 2; 11 12; 11 12]
```

One iteration of mean shift:

```
>>> [1 2 3 4 5].meanShift(1)
[3/2 2 3 4 9/2]
```

Specify the number of iterations:

```
>>> [1 2 3 4 5].meanShift(1, 5)
[3263/1296 3263/1296 3 4513/1296 4513/1296]
```

Run until convergence:

```
>>> [1 2 3 4 5].meanShift(1, Infinity)
[3 3 3 3 3]
```

* * *

See also: euclideanDistance, mean, meanShiftFilter

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MeanShift.html),
_W_
[1](https://en.wikipedia.org/wiki/Mean_shift)

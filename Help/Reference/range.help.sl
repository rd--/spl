# range

- _range(c)_

Answer the difference between the `min` and `max` values of the collection _c_.

At `Range`:

```
>>> 1:9.range
8
```

At `List`:

```
>>> 9.primesList.range
21
```

At `List` of lists:

```
>>> [
>>> 	4 9 2 10;
>>> 	6 9 7 12
>>> ].range
[2 0 5 2]

>>> [
>>> 	4 9 2 10;
>>> 	6 9 7 12
>>> ].transpose.range
[8 6]

>>> [
>>> 	4 9 2 10; 6 9 7 12
>>> ].catenate.range
10
```

* * *

See also: -, max, min, minMax

References:
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.ptp.html)

Categories: Math

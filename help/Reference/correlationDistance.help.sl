# correlationDistance

- _correlationDistance(u, v)_

Answer the correlation coefficient distance between vectors _u_ and _v_.

Correlation distance between numeric vectors:

```
>>> [1 2 3].correlationDistance([3 5 10])
(1 - (7 / (2 * 13.sqrt)))

>>> [1 5 2 3 10].correlationDistance([4 15 20 5 5])
1.21066
```

`correlationDistance` is equivalent to the `cosineDistance` of vectors shifted by their means:

```
>>> let u = [1 2 3];
>>> let v = [3 5 10];
>>> (u - u.mean).cosineDistance(v - v.mean)
u.correlationDistance(v)
```

* * *

See also: cosineDistance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CorrelationDistance.html),

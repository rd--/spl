# cosineDistance

- _cosineDistance(u, v)_

Answer the angular cosine distance between vectors _u_ and _v_.

`cosineDistance` is equivalent to _1 - u.v / (u.norm * v.norm)_.

Cosine distance between numeric vectors:

```
>>> [1 2 3].cosineDistance([3 5 7])
(1 - (17 * (2 / 581).sqrt))

>>> [1 5 2 3 10].cosineDistance([4 15 20 5 5])
0.40629
```

* * *

See also: correlationDistance

Guides: Distance Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CosineDistance.html),

Categories: Distance, Geometry

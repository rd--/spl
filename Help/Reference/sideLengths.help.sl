# sideLengths

- _sideLengths(g)_

Answer a `List` of the side lengths of the geometry _g_.

For a `Triangle` given by the points _A, B, C_,
the side lengths are given as _a, b, c_ where each length is of the line opposite,
or not including,
the point:

```
>>> Triangle([0 0; 1 0; 1 1])
>>> .sideLengths
[1 2.sqrt 1]
```

For a `Polygon` this is generalized to answer the side lengths between adjacent vertices starting at the second vertex:

```
>>> Polygon([0 0; 1 0; 1 1])
>>> .sideLengths
[1 2.sqrt 1]

>>> Polygon([0 0; 1 0; 1 1; 0 1])
>>> .sideLengths
[1 1 1 1]

>>> [1 6; 3 1; 7 2; 4 4; 8 5]
>>> .Polygon
>>> .sideLengths
[4.1231 3.6056 4.1231 7.0711 5.3852]
```

* * *

See also: Polygon, Triangle

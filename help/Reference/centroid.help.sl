# centroid

- _centroid(anObject)_

Answer the centroid of _anObject_.

Find the centroid of a `Circle`:

```
>>> Circle([0 0], 1).centroid
[0 0]
```

Find the centroid of a `Line`:

```
>>> Line([0 0], [2 2]).centroid
[1 1]
```

Find the centroid of a `Triangle`:

```
>>> Triangle([0 0], [1 0], [0 1]).centroid
[1/3 1/3]
```

Find the centroid of a `Rectangle`:

```
>>> Rectangle([0 0], [2 2]).centroid
[1 1]
```

Find the centroid of a `Polygon`:

```
>>> let p = Polygon([0 0; 1 0; 3/2 1/2; 1 1; 0 1; -1/2 1/2]);
>>> p.centroid
[1/2 1/2]
```

* * *

See also: Circle, Line, Polygon, Rectangle

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegionCentroid.html),
_W_
[1](https://en.wikipedia.org/wiki/Centroid)

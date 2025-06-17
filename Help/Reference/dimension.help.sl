# dimension

- _dimension(g)_

Answer the geometric dimension of the geometry _g_.

At `Point`,
the dimension of a planar point is `zero`,
the embedding dimension is two:

```
>>> let p = Point([0, 0]);
>>> (p.dimension, p.embeddingDimension)
(0, 2)
```

At `Point`,
the dimension of a volumetric point is `zero`,
the embedding dimension is three:

```
>>> let p = Point([0, 0, 0]);
>>> (p.dimension, p.embeddingDimension)
(0, 3)
```

The dimension of a `Line` is `one`:

```
>>> Line([0 0; 1 1]).dimension
1
```

The dimension of a `Circle` is `one`:

```
>>> Circle([0 0], 1).dimension
1
```

The dimension of a `Rectangle` is two:

```
>>> Rectangle([0 0], [1 1]).dimension
2
```

The dimension of a `Sphere` is two:

```
>>> Sphere([0 0 0], 1).dimension
2
```

The dimension of a `Polygon` is two:

```
>>> 5.regularPolygon([0 0], 1, 0).dimension
2
```

The dimension of a `Polyhedron` is three:

```
>>> [0 0].unitCube.dimension
3
```

* * *

See also: embeddingDimension, Circle, Line, Point, Polygon, Polyhedron, Rectangle, Sphere, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegionDimension.html)

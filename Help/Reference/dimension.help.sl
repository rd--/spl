# dimension

- _dimension(anObject)_

Answer the geometric dimension of _anObject_.

The dimension of a planar point is `zero`, the embedding dimension is two:

```
>>> let p = Point([0, 0]);
>>> (p.dimension, p.embeddingDimension)
(0, 2)
```

The dimension of a volumetric point is `zero`, the embedding dimension is three:

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

The dimension of a `Rectangle` is two:

```
>>> Rectangle([0 0], [1 1]).dimension
2
```

* * *

See also: embeddingDimension, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegionDimension.html)

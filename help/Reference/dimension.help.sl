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

* * *

See also: embeddingDimension, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegionDimension.html)

# embeddingDimension

- _embeddingDimension(anObject)_

The dimension of the space in which _anObject_ is embedded.

The dimension of a planar point is `zero`, the embedding dimension is two:

```
>>> let p = Point(0, 0);
>>> (p.dimension, p.embeddingDimension)
(0, 2)
```

The dimension of a volumetric point is `zero`, the embedding dimension is three:

```
>>> let p = Point(0, 0, 0);
>>> (p.dimension, p.embeddingDimension)
(0, 3)
```

* * *

See also: dimension, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegionEmbeddingDimension.html)

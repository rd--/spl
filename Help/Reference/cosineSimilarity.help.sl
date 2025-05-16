# cosineSimilarity

- _cosineSimilarity(u, v)_

Answer the cosine similarity between vectors _u_ and _v_.

`cosineSimilarity` is equivalent to _1 - u.v / (u.norm * v.norm)_.

Cosine similarity between numeric vectors:

```
>>> [1 2 3].cosineSimilarity([3 5 7])
17 * (2 / 581).sqrt

>>> [1 5 2 3 10].cosineSimilarity([4 15 20 5 5])
0.5937
```

* * *

See also: correlationSimilarity, cosineDistance

Guides: Similarity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CosineSimilarity.html),
_W_
[1](https://en.wikipedia.org/wiki/Cosine_similarity)

Categories: Similarity, Geometry

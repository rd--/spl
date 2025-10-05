# pairwiseSum

- _pairwiseSum([x₁ x₂ …])_

Answer the `sum` of the sequence _x_ calculated using the _pairwise summation_ algorithm.

```
>>> let r = Sfc32(289013);
>>> let l = r.randomReal([0 1E10], [1E4]);
>>> (l.sum, l.pairwiseSum, l.neumaierSum)
(
	49800261849623.41,
	49800261849623.64,
	49800261849623.64
)
```

* * *

See also: +, neumaierSum, sum

Guides: List Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Pairwise_summation)

Further Reading: Higham 1993

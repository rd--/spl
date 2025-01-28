# reshapeLike

- _reshapeLike(material, model)_

Answer a `List` with the same structure as _model_ and with elements drawn from _material_.
Elements are drawn in `ravel` order,
truncating if the result has smaller bound than the right argument,
and repeating cyclically if it has larger bound.

_model_ does not need to be a regular array,
_reshapeLike_ will reproduce any structure.

```
>>> 6:-1:1.reshapeLike([1; 2 3; 4 5 6])
[6; 5 4; 3 2 1]
```

Cycle shorter input:

```
>>> 1:3.reshapeLike([1; 2 3; 4 5 6])
[1; 2 3; 1 2 3]
```

Reshape non-vector input, discarding excess elements:

```
>>> [9 8 7; 6 5 4; 3 2 1]
>>> .reshapeLike([1; 2 3; 4 5 6])
[9; 8 7; 6 5 4]
```

Reverse complex nested structure:

```
>>> let l = [[1, 2, [3, 4], [[5], 6], 7], 8, [[9]]];
>>> l.flatten.reversed.reshapeLike(l)
[[9, 8, [7, 6], [[5], 4], 3], 2, [[1]]]
```

* * *

See also: deepCollect, flatten, rank, reshape, shape

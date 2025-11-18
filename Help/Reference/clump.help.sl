# clump

- _clump([x₁ x₂ …], n)_

Answer a `List` of sub-sequences of the sequence _x_,
each having _n_ items.

Create a 2×4 matrix from an 8 place vector:

```
>>> 8.iota.clump(4)
[
	1 2 3 4;
	5 6 7 8
]
```

If the sequence `size` is not `divisible` by _anInteger_ the last item of the answer will have fewer than _anInteger_ places:

```
>>> 8.iota.clump(3)
[
	1 2 3;
	4 5 6;
	7 8
]
```

This is as distinct from both `partition`:

```
>>> 8.iota.partition(3)
[
	1 2 3;
	4 5 6
]
```

and `reshape`:

```
>>> 8.iota.reshape([3 3])
[
	1 2 3;
	4 5 6;
	7 8 1
]
```

`clump` is equivalent to `chunksOf`:

```
>>> 8.iota.chunksOf(3)
[
	1 2 3;
	4 5 6;
	7 8
]
```

* * *

See also: chunksOf, partition, reshape

Guides: List Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-clump)

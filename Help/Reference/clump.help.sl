# clump

- _clump(aSequence, anInteger)_

Answer a `List` of sub-sequences of _aSequence_,
each having _anInteger_ items.

Create a 2×4 matrix from an 8 place vector:

```
>>> [1 .. 8].clump(4)
[1 2 3 4; 5 6 7 8]
```

If the sequence `size` is not `divisible` by _anInteger_ the last item of the answer will have fewer than _anInteger_ places:

```
>>> [1 .. 8].clump(3)
[1 2 3; 4 5 6; 7 8]
```

This is as distinct from both `partition`:

```
>>> [1 .. 8].partition(3)
[1 2 3; 4 5 6]
```

and `reshape`:

```
>>> [1 .. 8].reshape([3 3])
[1 2 3; 4 5 6; 7 8 1]
```

If is equivalent to `chunksOf`:

```
>>> [1 .. 8].chunksOf(3)
[1 2 3; 4 5 6; 7 8]
```

* * *

See also: chunksOf, partition, reshape

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-clump)

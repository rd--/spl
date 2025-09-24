# rank

- _rank(x)_

Answer the rank of the object _x_.
In the Apl array model,
the `rank` of an array is the number of dimensions or axes in its structure,
or the length of its `shape`.

Arrays are given names based on their rank.
A rank zero array is called a _scalar_:

```
>>> 1.rank
0

>>> 1.shape.size
0
```

A rank one array is called a _vector_:

```
>>> [1 2 3 4 5 6 7 8].rank
1

>>> [1 .. 8].shape.size
1
```

A rank two array is called a _matrix_:

```
>>> [1 2 3 4; 5 6 7 8].rank
2

>>> [1 2; 3 4].shape.size
2
```

Sᴘʟ calls a rank three array a _volume_,
in some other contexts it is called a _box_:

```
>>> let a = [1 2; 3 4:; 5 6; 7 8];
>>> (a.rank, a.shape.size)
(3, 3)
```

Tree structures that are not arrays,
or are _irregular arrays_,
do not have a shape,
and therefore do not have a rank:

```
>>> { [1; 2 3].rank }.hasError
true
```

Such structures do have a `depth`,
an `arrayDepth` and a `dimensions`:

```
>>> [1; 2 3].depth
3

>>> [1; 2 3].arrayDepth
1

>>> [1; 2 3].dimensions
[2]
```

The `depth` of an array is one greater than its `rank`:

```
>>> let a = [1 2; 3 4:; 5 6; 7 8];
>>> (a.rank, a.depth)
(3, 4)
```

* * *

See also: arrayDepth, depth, dimensions, isArray, isMatrix, isVector, matrixRank, reshape, Sequence, shape

Guides: Matrix Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Rank)
[2](https://aplwiki.com/wiki/Rank_(operator)),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TensorRank.html)

# rank

- _rank(anArray | anObject)_

In the Apl array model,
the `rank` of an array is the number of dimensions or axes in its structure,
or the length of its `shape`.

Arrays are given names based on their rank.
A rank zero array is called a _scalar_:

```
>>> 1.rank
0
```

A rank one array is called a _vector_:

```
>>> [1 2 3 4 5 6 7 8].rank
1
```

A rank two array is called a _matrix_:

```
>>> [1 2 3 4; 5 6 7 8].rank
2
```

Spl calls a rank three array a _volume_:

```
>>> [1 2; 3 4:; 5 6; 7 8].rank
3
```

Tree structures that are not arrays,
or are _irregular arrays_,
do not have a shape,
and therefore do not have a rank:

```
>>> { [1; 2 3].rank }.ifError { true }
true
```

Such structures do have a `depth`:

```
>>> [1; 2 3].depth
3
```

The `depth` of an array is one greater than its `rank`:

```
>>> let a = [1 2; 3 4:; 5 6; 7 8];
>>> (a.rank, a.depth)
(3, 4)
```

* * *

See also: depth, isArray, isMatrix, isVector, matrixRank, reshape, Sequence, shape

Guides: Matrix Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Rank)
[2](https://aplwiki.com/wiki/Rank_(operator))

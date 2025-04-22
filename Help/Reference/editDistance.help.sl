# editDistance

- _editDistance(u, v)_

Answer the edit or Levenshtein distance between vectors _u_ and _v_.

Edit distance between two strings:

```
>>> 'abc'.editDistance('cba')
2

>>> 'kitten'.editDistance('sitting')
3
```

Edit distance between two vectors:

```
>>> [1 0 0 1 1].editDistance([0 0 1 0 1])
2
```

Compute distance between strings of unequal length:

```
>>> 'abcdef'.editDistance('cba')
5
```

Compute distance between any strings of equal length:

```
>>> 'abcdefghijklmn'.editDistance(
>>> 	'akmdjbglhfecni'
>>> )
11
```

`editDistance` is less than or equal to `hammingDistance` for strings of equal length:

```
>>> 'bccbbcb'.editDistance(
>>> 	'ccbbccb'
>>> )
2

>>> 'bccbbcb'.hammingDistance(
>>> 	'ccbbccb'
>>> )
3
```

* * *

See also: editDistance, levenshteinDistance, manhattanDistance

Guides: Distance Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EditDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Levenshtein_distance)

Categories: Distance

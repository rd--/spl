# levenshteinDistance

- _levenshteinDistance(u, v)_

Answer the Levenshtein distance between vectors _u_ and _v_,
also known as `editDistance`.

Identity:

```
>>> [1 2 3].levenshteinDistance([1 2 3])
0
```

Substitution at end:

```
>>> [1 2 3].levenshteinDistance([1 2 -3])
1
```

Deletion from end:

```
>>> [1 2 3].levenshteinDistance([1 2])
1
```

Addition at end:

```
>>> [1 2].levenshteinDistance([1 2 3])
1
```

Addition in interior:

```
>>> [1 3].levenshteinDistance([1 2 3])
1
```

Deletion from interior:

```
>>> [1 2 3].levenshteinDistance([1 3])
1
```

Substitutions:

```
>>> [1 2 3].levenshteinDistance([1 3 2])
2
```

* * *

See also: editDistance, hammingDistance, manhattanDistance

References:
_W_
[1](https://en.wikipedia.org/wiki/Levenshtein_distance)

Further Reading: Levenshtein (1966)


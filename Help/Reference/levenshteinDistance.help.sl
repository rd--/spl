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

>>> 'uninformed'.levenshteinDistance(
>>> 	'uniformed'
>>> )
1
```

Substitutions:

```
>>> [1 2 3].levenshteinDistance([1 3 2])
2
```

Compute distance between strings of unequal length:

```
>>> 'abcdef'.levenshteinDistance('cba')
5
```

Levenshtein distance treats transposition as separate deletion and insertion operations:

```
>>> 'ac'.levenshteinDistance('ca')
2
```

* * *

See also: editDistance, hammingDistance, damerauLevenshteinDistance, manhattanDistance

Guides: Distance Functions, Similarity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EditDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Levenshtein_distance)

Further Reading: Levenshtein 1966

Categories: Distance

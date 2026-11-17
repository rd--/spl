# levenshteinDistance

- _levenshteinDistance(u, v)_

Answer the Levenshtein distance between vectors _u_ and _v_,
also known as `editDistance`.

Identity:

```
>>> [1 2 3].levenshteinDistance([1 2 3])
0L
```

Substitution at end:

```
>>> [1 2 3].levenshteinDistance([1 2 -3])
1L
```

Deletion from end:

```
>>> [1 2 3].levenshteinDistance([1 2])
1L
```

Addition at end:

```
>>> [1 2].levenshteinDistance([1 2 3])
1L
```

Addition in interior:

```
>>> [1 3].levenshteinDistance([1 2 3])
1L
```

Deletion from interior:

```
>>> [1 2 3].levenshteinDistance([1 3])
1L
```

At `String`:

```
>>> 'uninformed'.levenshteinDistance(
>>> 	'uniformed'
>>> )
1L

>>> 'boats'.levenshteinDistance(
>>> 	'float'
>>> )
3L
```

Substitutions:

```
>>> [1 2 3].levenshteinDistance([1 3 2])
2L
```

Compute distance between strings of unequal length:

```
>>> 'abcdef'.levenshteinDistance('cba')
5L
```

Levenshtein distance treats transposition as separate deletion and insertion operations:

```
>>> 'ac'.levenshteinDistance('ca')
2L
```

* * *

See also: damerauLevenshteinDistance, editDistance, hammingDistance, manhattanDistance, needlemanWunschAlgorithm

Guides: Distance Functions, Similarity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/EditDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Levenshtein_distance)

Further Reading: Levenshtein 1966

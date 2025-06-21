# damerauLevenshteinDistance

- _damerauLevenshteinDistance(u, v)_

Answer the Damerau-Levenshtein distance between vectors _u_ and _v_.

Damerau–Levenshtein distance between two strings:

```
>>> 'abc'.damerauLevenshteinDistance(
>>> 	'cba'
>>> )
2
```

Damerau–Levenshtein distance between two vectors:

```
>>> [1 0 0 1 1]
>>> .damerauLevenshteinDistance(
>>> 	[0 0 1 0 1]
>>> )
2
```

Damerau–Levenshtein distance between biomolecular sequences:

```
>>> 'CGCATAG'
>>> .damerauLevenshteinDistance(
>>> 	'GCATGA'
>>> )
2
```

Compute distance between strings of unequal length:

```
>>> 'abcdef'
>>> .damerauLevenshteinDistance(
>>> 	'cba'
>>> )
5
```

Damerau–Levenshtein distance counts transposition as a single operation:

```
>>> 'ac'.damerauLevenshteinDistance(
>>> 	'ca'
>>> )
1
```

* * *

See also: editDistance, hammingDistance, levenshteinDistance, manhattanDistance

Guides: Distance Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/DamerauLevenshteinDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance)

Categories: Distance

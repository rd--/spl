# wagnerFischerAlgorithm

- _wagnerFischerAlgorithm(a, b)_

Implement the Wagner–Fischer algorithm,
a dynamic programming algorithm that computes the edit distance between two strings _a_ and _b_.
The answer is a matrix, the entry at _(|a|,|b|)_ gives the Levenshtein distance.

A score of three, for _s≠k_ and _i≠e_ and _+g_:

```
>>> wagnerFischerAlgorithm(
>>> 	'sitting',
>>> 	'kitten'
>>> )
[
	0 1 2 3 4 5 6;
	1 1 2 3 4 5 6;
	2 2 1 2 3 4 5;
	3 3 2 1 2 3 4;
	4 4 3 2 1 2 3;
	5 5 4 3 2 2 3;
	6 6 5 4 3 3 2;
	7 7 6 5 4 4 3
]

>>> levenshteinDistance(
>>> 	'sitting',
>>> 	'kitten'
>>> )
3
```

A score of three, for _+a_ and _+t_ and _n≠r_:

```
>>> wagnerFischerAlgorithm(
>>> 	'Sunday',
>>> 	'Saturday'
>>> )
[
	0 1 2 3 4 5 6 7 8;
	1 0 1 2 3 4 5 6 7;
	2 1 1 2 2 3 4 5 6;
	3 2 2 2 3 3 4 5 6;
	4 3 3 3 3 4 3 4 5;
	5 4 3 4 4 4 4 3 4;
	6 5 4 4 5 5 5 4 3
]

>>> levenshteinDistance(
>>> 	'Sunday',
>>> 	'Saturday'
>>> )
```

* * *

See also: levenshteinDistance, needlemanWunschAlgorithm

Guides: Distance Functions, Similarity Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Wagner%E2%80%93Fischer_algorithm)

Further Reading: Wagner 1973

Categories: Distance

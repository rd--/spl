# needlemanWunschAlgorithm

- _needlemanWunschAlgorithm(a, b, c, s)_

Implement the Needleman–Wunsch algorithm to align sequences _a_ and _b_ using insertion marker _c_ and given scoring-system _s_.
The scores are for _(match, mismatch, indel)_ where _indel_ is the insertion or deletion score.
If elided the scores are _1,-1,-1_.

Align two small DNA sequences:

```
>>> needlemanWunschAlgorithm(
>>> 	'GCATGCG',
>>> 	'GATTACA',
>>> 	'-'
>>> )
[
	'GCATG-CG'
	'G-ATTACA'
]
```

Align two short protein sequences,
note that the initial insertion could also occur at the start of the sequence:

```
>>> needlemanWunschAlgorithm(
>>> 	'FTFTALILLAVAV',
>>> 	'FTALLLAAV',
>>> 	'-'
>>> )
[
	'FTFTALILLAVAV'
	'FT--AL-LLA-AV'
]
```

The Levenshtein distance counts the number of mismatches and insertions:

```
>>> levenshteinDistance(
>>> 	'GCATGCG',
>>> 	'GATTACA'
>>> )
4
```

Align sequences with insertions and no mismatches:

```
>>> needlemanWunschAlgorithm(
>>> 	'ac',
>>> 	'abcd',
>>> 	'-'
>>> )
[
	'a-c-'
	'abcd'
]

>>> levenshteinDistance(
>>> 	'ac',
>>> 	'abcd'
>>> )
2
```

At `List`,
insertions are indicated by `zero`:

```
>>> needlemanWunschAlgorithm(
>>> 	[3 2 1 4 3 2 3],
>>> 	[3 1 4 4 1 2 1],
>>> 	0
>>> )
[
	3 2 1 4 3 0 2 3;
	3 0 1 4 4 1 2 1
]
```

* * *

See also: levenshteinDistance, sequenceAlignment, wagnerFischerAlgorithm

Guides: Distance Functions, Sequence Alignment Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Needleman%E2%80%93Wunsch_algorithm)
[2](https://en.wikipedia.org/wiki/Indel)

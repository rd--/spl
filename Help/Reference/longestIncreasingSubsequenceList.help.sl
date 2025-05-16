# longestIncreasingSubsequenceList

- _longestIncreasingSubsequenceList(aSequence)_

Answer a `List` of the longest ascending sequences of contiguous or disjoint elements in _aSequence_.

```
>>> [6 3 5 10 11 2 9 14 13 7 4 8 12]
>>> .longestIncreasingSubsequenceList
[
	3 5 7 8 12;
	3 5 10 11 12;
	3 5 10 11 13;
	3 5 10 11 14
]

>>> [3 2 6 4 5 1]
>>> .longestIncreasingSubsequenceList
[
	2 4 5;
	3 4 5
]

>>> [0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15]
>>> .longestIncreasingSubsequenceList
[
	0 2 6 9 11 15;
	0 2 6 9 13 15;
	0 4 6 9 11 15;
	0 4 6 9 13 15
]

>>> [7 2 8 1 3 4 10 6 9 5]
>>> .longestIncreasingSubsequenceList
[
	1 3 4 6 9;
	2 3 4 6 9
]
```

If the sequence contains duplicate elements, the answer may also:

```
>>> [6 0 0 4 4 7 6 6 9 5]
>>> .longestIncreasingSubsequenceList
>>> .nub
[
	0 4 6 9;
	0 4 7 9
]
```

* * *

See also: longestIncreasingSubsequence

Guides: Sort Functions

# noncontiguousSubsequences

- _noncontiguousSubsequences([x₁ x₂ …])_

Answer the non-contiguous subsequences of the sequence _x_.
All subsequences are given by `subsequences`,
contiguous subsequences are given by `contiguousSubsequences`,
or by `substrings`,
which also includess the empty and singleton and complete substrings.

At `String`:

```
>>> 'abcd'.noncontiguousSubsequences
['ac' 'ad' 'bd' 'abd' 'acd']

>>> 'abcd'.contiguousSubsequences
['ab' 'bc' 'cd' 'abc' 'bcd']

>>> 'abcd'.substrings
[
	'' 'a' 'b' 'c' 'd'
	'ab' 'bc' 'cd' 'abc' 'bcd'
	'abcd'
]
```

At `List`:

```
>>> [1 2 3 4]
>>> .noncontiguousSubsequences
>>> .canonicalSort
[1 3; 1 4; 2 4; 1 2 4; 1 3 4]

>>> [1 2 3 4 5]
>>> .noncontiguousSubsequences
>>> .canonicalSort
[
	1 3; 1 4; 1 5; 2 4; 2 5; 3 5
	;
	1 2 4; 1 2 5; 1 3 4; 1 3 5; 1 4 5;
	2 3 5; 2 4 5
	;
	1 2 3 5; 1 2 4 5; 1 3 4 5
]
```

* * *

See also: differences, powerSetDo, subsequences, subsets, substrings

Guides: Sequence Alignment Functions

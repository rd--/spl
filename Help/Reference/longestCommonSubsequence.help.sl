# longestCommonSubsequence

- _longestCommonSubsequence(u, v)_

Answer the longest sequence of contiguous or disjoint elements common to two sequences.
If there are several common sequences of the same length, answer the one that begins earliest in _u_.

Find the longest noncontiguous sequence common to two strings:

```
>>> 'XMJYAUZ'
>>> .longestCommonSubsequence(
>>> 	'MZJAWXU'
>>> )
'MJAU'

>>> 'AAABBBBCCCCC'
>>> .longestCommonSubsequence(
>>> 	'CCCBBBAAABABA'
>>> )
'AAABB'
```

Find the longest noncontiguous sequence common to two lists:

```
>>> [1 2 3 4]
>>> .longestCommonSubsequence(
>>> 	[2 3 1 4]
>>> )
[2 3 4]

>>> [1 2 3 4]
>>> .longestCommonSubsequence(
>>> 	[1 2 2 4 5 3 3 3 2 4]
>>> )
[1 2 3 4]
```

* * *

See also: levenshteinDistance, longestCommonSubstring

Guides: Sequence Alignment Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LongestCommonSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Longest_common_subsequence)

Further Reading: Hirschberg 1975, Hunt 1977

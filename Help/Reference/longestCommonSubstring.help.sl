# longestCommonSubstring

- _longestCommonSubstring(u, v)_

Answer the longest contiguous subsequence of elements common to two sequences.
If there are several common subsequences of the same length, answer the one that appears earliest.

Find the longest contiguous subsequence common to two strings:

```
>>> 'AAABBBBCCCCC'
>>> .longestCommonSubstring(
>>> 	'CCCBBBAAABABA'
>>> )
'AAAB'
```

Find the longest contiguous subsequence common to two lists:

```
>>> [1 2 3 4].longestCommonSubstring(
>>> 	[2 3 1 4]
>>> )
[2 3]

>>> [1 2 3 4].substringsInCommon(
>>> 	[2 3 1 4],
>>> 	2
>>> )
[
	[2 3]
]
```

C.f. `longestCommonSubsequence`:

```
>>> let s = 'BDACADBC';
>>> let t = 'ADBCABAD';
>>> (
>>> 	s.longestCommonSubstring(t),
>>> 	s.longestCommonSubsequence(t)
>>> )
('ADBC', 'BCAD')
```

* * *

See also: longestCommonSubsequence, longestCommonSubstringList, partition, subsequences, substringsInCommon

Guides: Sequence Alignment Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LongestCommonSubsequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Longest_common_substring)

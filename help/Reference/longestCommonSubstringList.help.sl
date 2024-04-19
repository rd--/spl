# longestCommonSubstringList

- _longestCommonSubstringList(aSequence, anotherSequence)_

Answer a `List` of the longest contiguous substrings of elements common to two sequences.

Find the longest contiguous subsequences common to two strings:

```
>>> 'ABCBCDCDE'.longestCommonSubstringList('ABCDE')
[
	'ABC'
	'BCD'
	'CDE'
]

>>> 'ABCBCDCDE'.longestCommonSubstringList('ABCBABCDCBCDEDC')
[
	'ABCB'
	'CBCD'
	'BCDC'
]

>>> 'CANADAS'.longestCommonSubstringList('BADANAT')
[
	'ANA'
	'ADA'
]
```

C.f. `longestCommonSubsequence`:

```
>>> let s = 'BDACADBC';
>>> let t = 'ADBCABAD';
>>> s.longestCommonSubsequence(t)
'BCAD'
```

* * *

See also: longestCommonSubsequence

References:
_W_
[1](https://en.wikipedia.org/wiki/Longest_common_substring)

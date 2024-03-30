# longestCommonSequence

- _longestCommonSequence(aSequence, anotherSequence)_

Answer the longest sequence of contiguous or disjoint elements common to two sequences.
If there are several common sequences of the same length, answer the one that begins earliest in _aSequence_.

Find the longest noncontiguous sequence common to two strings:

```
>>> 'AAABBBBCCCCC'.longestCommonSequence('CCCBBBAAABABA')
'AAABB'

>>> 'thisisatest'.longestCommonSequence('testing123testing')
'tsitest'
```

Find the longest noncontiguous sequence common to two lists:

```
>>> ['A' 'B' 'C' 'D'].longestCommonSequence(['B' 'C' 'A' 'D'])
['B' 'C' 'D']

>>> [1 2 3 4].longestCommonSequence([1 2 2 4 5 3 3 3 2 4])
[1 2 3 4]
```

* * *

See also: levenshteinDistance, longestCommonSubsequence

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LongestCommonSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Longest_common_subsequence)

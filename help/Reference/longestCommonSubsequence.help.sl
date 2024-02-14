# longestCommonSubsequence

_longestCommonSubsequence(aSequence, anotherSequence)_

Answer the longest contiguous subsequence of elements common to two sequences.
If there are several common subsequences of the same length, answer the one that appears earliest.

Find the longest contiguous subsequence common to two strings:

```
>>> 'AAABBBBCCCCC'.longestCommonSubsequence('CCCBBBAAABABA')
'AAAB'

>>> 'AAABBBBCCCCC'.longestCommonSubsequences('CCCBBBAAABABA')
['AAAB']
```

Find the longest contiguous subsequence common to two lists:

```
>>> ['A' 'B' 'C' 'D'].longestCommonSubsequence(['B' 'C' 'A' 'D'])
['B' 'C']

>>> ['A' 'B' 'C' 'D'].subsequencesInCommon(['B' 'C' 'A' 'D'], 2)
[['B' 'C']]
```

* * *

See also: longestCommonSubsequences, partition, subsequences, subsequencesInCommon

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LongestCommonSubsequence.html)

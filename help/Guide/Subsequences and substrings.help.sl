# Subsequences and substrings

A _subsequence_ is a sequence that is contained in another sequence.

The sequences _23_ and _35_ are both subsequence of _12345_:

```
>>> let p = [1 2 3 4 5];
>>> [2 3; 3 5].collect { :q |
>>> 	p.includesSubsequence(q)
>>> }
[true true]
```

The first is _contiguous_, the second is _disjoint_.
A _substring_ is a contiguous subsequence.

Of _23_ and _35_ only the first is a substring of _12345_:

```
>>> let p = [1 2 3 4 5];
>>> [2 3; 3 5].collect { :q |
>>> 	p.includesSubstring(q)
>>> }
[true false]
```

Functions for collecting:

- `subsequences`
- `substrings`

Functions for enumerating:

- `subsequencesDo`
- `substringsDo`

Functions for testing:

- `includesSubsequence`
- `includesScatteredSubsequence`
- `includesSubstring`

Functions for locating:

- `indexOfSubstringStartingAt`
- `indexOfSubstring`
- `indicesOfSubsequence`
- `indicesOfSubstringStartingAt`
- `indicesOfSubstring`

Functions for partitioning:

- `partition`
- `partitionDo`

Longest functions:

- `longestCommonSubsequence`
- `longestCommonSubstringList`
- `longestCommonSubstring`
- `longestIncreasingSubsequenceList`
- `longestIncreasingSubsequence`

Order functions:

- `increasingSubsequenceList`
- `orderedSubstrings`
- `substringsInCommon`

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LongestIncreasingScatteredSubsequence.html)
_W_
[1](https://en.wikipedia.org/wiki/Longest_common_subsequence)
[2](https://en.wikipedia.org/wiki/Longest_increasing_subsequence)

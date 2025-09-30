# longestIncreasingSubsequence

- _longestIncreasingSubsequence(u)_

Answer the longest ascending sequence of contiguous or disjoint elements in the sequence _u_.

Find the longest ordered substring, in this case formed by contiguous characters:

```
>>> 'BAABCA'
>>> .longestIncreasingSubsequence
'ABC'
```

and in this case formed by non-contiguous characters:

```
>>> 'BAACBC'
>>> .longestIncreasingSubsequence
'ABC'
```

Find the longest ascending sequence of elements in a list:

```
>>> [2 8 9 5 6 7 1]
>>> .longestIncreasingSubsequence
[2 5 6 7]

>>> [3 2 6 4 5 1]
>>> .longestIncreasingSubsequence
[2 4 5]

>>> [
>>> 	0 8 4 12 2 10 6 14 1 9
>>> 	5 13 3 11 7 15
>>> ].longestIncreasingSubsequence
[0 2 6 9 11 15]

>>> [
>>> 	6 0 0 4 4 7 6 6 9 5
>>> ].longestIncreasingSubsequence
[0 4 6 9]

>>> [2 9 4 7 3 4 5]
>>> .longestIncreasingSubsequence
[2 3 4 5]

>>> [
>>> 	6 3 4 8 10 5 7 1 9 2
>>> ].longestIncreasingSubsequence
[3 4 5 7 9]

>>> [
>>> 	7 4 4 5 2 7 1 8 13 2
>>> 	10 4 9 1 4 5 5 4 3 10
>>> 	3 4 5 8 15 7 11 19
>>> ].longestIncreasingSubsequence
[1 2 3 4 5 7 11 19]
```

At the empty list:

```
>>> [].longestIncreasingSubsequence
[]
```

At decreasing list:

```
>>> [10 .. 1].longestIncreasingSubsequence
[1]
```

At increasing list is identity:

```
>>> [1 .. 10].longestIncreasingSubsequence
[1 .. 10]
```

In cases where there are many equally long subsequences answer any one:

```
>>> let x = [3 1 4 1 5 9 2 6 5 3 5 8 9 7 9];
>>> let y = x.longestIncreasingSubsequenceList;
>>> (
>>> 	x.longestIncreasingSubsequence,
>>> 	y.anyOne,
>>> 	y.size
>>> )
([1 2 3 5 7 9], [1 2 3 5 7 9], 12)
```

* * *

See also: longestCommonSubsequence, longestIncreasingSubsequenceList, patienceSort

Guides: List Functions, Sequence Alignment Functions, Sort Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Essays/Longest_Increasing_Subsequence),
_Mathematica_
[1](https://mathworld.wolfram.com/LongestIncreasingScatteredSubsequence.html)
[2](https://reference.wolfram.com/language/ref/LongestOrderedSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Longest_increasing_subsequence)

Further Reading: Erdös 1935, Fredman 1975, Hammersley 1972, Schensted 1961

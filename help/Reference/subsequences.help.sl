# subsequences

_subsequences(aSequence)_

All possible subsequences:

```
>>> 1:3.subsequences
[; 1; 2; 3; 1 2; 2 3; 1 2 3]
```

All possible subsequences containing up to two elements:

```
>>> 1:4.subsequences { :each | each.size <= 2 }
[; 1; 2; 3; 4; 1 2; 2 3; 3 4]
```

Subsequences containing exactly two elements:

```
>>> 1:4.subsequences { :each | each.size = 2 }
1:4.partition(2, 1)
```

All subsequences with even length:

```
>>> 1:5.subsequences { :each | each.size.isEven }
[; 1 2; 2 3; 3 4; 4 5; 1 2 3 4; 2 3 4 5]
```

The 181st subsequence:

```
>>> 1:20.subsequences[181]
[6 .. 18]
```

Obtain all subsequences common to two lists:

```
>>> let f = { :p :q :w:/1 | p.subsequences(w:/1).intersection(q.subsequences(w:/1)) };
>>> [1 2 3 5 4].f([2 3 5 1 4], { :each | each.size = 2 })
[2 3; 3 5]
```

Compare to longestCommonSubsequence:

```
>>> [1 2 3 5 4].longestCommonSubsequence([2 3 5 1 4])
[2 3 5]
```

Subsequences preserves the order of the input:

```
>>> 3:1.subsequences
[; 3; 2; 1; 3 2; 2 1; 3 2 1]
```

Different occurrences of the same element are treated as distinct:

```
>>> [1 2 2 2].subsequences
[; 1; 2; 2; 2; 1 2; 2 2; 2 2; 1 2 2; 2 2 2; 1 2 2 2]
```

Construct a 3×3 Hilbert matrix:

```
>>> (1 / 1:5).subsequences { :each | each.size = 3 }
[1 1/2 1/3; 1/2 1/3 1/4; 1/3 1/4 1/5]

>>> (1 / 1:5).partition(3, 1)
[1 1/2 1/3; 1/2 1/3 1/4; 1/3 1/4 1/5]
```

Subsequences generates only one list of length 0:

```
>>> [1 1 2].subsequences
[; 1; 1; 2; 1 1; 1 2; 1 1 2]
```

This follows the behavior of _powerSet_:

```
>>> [1 1 2].powerSet
[; 1; 1; 1 1; 2; 1 2; 1 2; 1 1 2]
```

* * *

See also: partition, powerSet, longestCommonSubsequence

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Subsequences.html)

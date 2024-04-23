# subsequences

- _subsequences(aSequence)_
- _subsequences(aSequence, aBlock:/1)_

All possible contiguous subsequences (substrings):

```
>>> 1:3.subsequences
[; 1; 2; 3; 1 2; 2 3; 1 2 3]
```

All possible subsequences containing up to two elements:

```
>>> 1:4.subsequences { :each |
>>> 	each.size <= 2
>>> }
[; 1; 2; 3; 4; 1 2; 2 3; 3 4]
```

Subsequences containing exactly two elements:

```
>>> 1:4.subsequences { :each |
>>> 	each.size = 2
>>> }
1:4.partition(2, 1)
```

All subsequences with even length:

```
>>> 1:5.subsequences { :each |
>>> 	each.size.isEven
>>> }
[; 1 2; 2 3; 3 4; 4 5; 1 2 3 4; 2 3 4 5]
```

The 181st subsequence:

```
>>> 1:20.subsequences[181]
[6 .. 18]
```

Obtain all subsequences common to two lists:

```
>>> let f = { :p :q :w:/1 |
>>> 	p.subsequences(w:/1).intersection(q.subsequences(w:/1))
>>> };
>>> [1 2 3 5 4].f([2 3 5 1 4], { :each |
>>> 	each.size = 2
>>> })
[2 3; 3 5]
```

Compare to `longestCommonSubsequence`:

```
>>> [1 2 3 5 4].longestCommonSubsequence([2 3 5 1 4])
[2 3 5 4]
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

This follows the behavior of `powerSet`:

```
>>> [1 1 2].powerSet
[; 1; 1; 1 1; 2; 1 2; 1 2; 1 1 2]
```

_123121321_ is a three-superpermutation, since it contains as substrings each of the possible permutations of _123_:

```
>>> let l = [1 2 3 1 2 1 3 2 1];
>>> let s = l.subsequences;
>>> [1 2 3].permutations.allSatisfy { :each | s.includes(each) }
true
```

Likewise _123412314231243121342132413214321_ is a four-superpermutation:

```
>>> let l = [1 2 3 4 1 2 3 1 4 2 3 1 2 4 3 1 2 1 3 4 2 1 3 2 4 1 3 2 1 4 3 2 1];
>>> let s = l.subsequences;
>>> [1 2 3 4].permutations.allSatisfy { :each | s.includes(each) }
true
```

* * *

See also: partition, powerSet, longestCommonSubsequence, subsets, tuples

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Subsequences.html)

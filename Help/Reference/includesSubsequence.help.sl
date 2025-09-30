# includesSubsequence

- _includesSubsequence(u, v)_

Answer `true` if the sequence _u_ includes another sequence _v_ as either a contiguous or disjoint subsequence.

_abcde_ includes _ce_:

```
>>> let p = 'abcde';
>>> let q = 'ce';
>>> p.includesSubsequence(q)
true
```

_12345_ includes _35_:

```
>>> let p = [1 2 3 4 5];
>>> let q = [3 5];
>>> p.includesSubsequence(q)
true
```

This is the same as, though it can be more efficient than, asking if any of the subsequences matches:

```
>>> let p = [1 2 3 4 5];
>>> let q = [3 5];
>>> p.subsequences.select { :each |
>>> 	each = q
>>> }.isEmpty.not
true
```

_abcde_ includes _cd_, which is a substring as well as a subsequence:

```
>>> 'abcde'.includesSubsequence('cd')
true

>>> [1 2 3 4 5].includesSubsequence([3 4])
true
```

* * *

See also: includesSubstring, subsequences

Guides: List Functions, String Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Subsequence)

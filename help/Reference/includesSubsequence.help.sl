# includesSubsequence

- _includesSubsequence(aSequence, anotherSequence)_

Answer `true` if _aSequence_ includes _anotherSequence_ as either a contiguous or disjoint subsequence.

_abcde_ includes _ce_:

```
>>> let p = 'abcde';
>>> let q = 'ce';
>>> p.includesSubsequence(q)
true

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

_abcde_ include _cd_, which is a substring as well as a subsequence:

```
>>> 'abcde'.includesSubsequence('cd')
true

>>> [1 2 3 4 5].includesSubsequence([3 4])
true
```

* * *

See also: includesSubtring, subsequences

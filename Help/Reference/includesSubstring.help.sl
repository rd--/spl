# includesSubstring

- _includesSubstring(aSequence, anotherSequence)_

Answer `true` if _aSequence_ includes _anotherSequence_ as a substring (a contiguous subsequence).

_abcde_ includes _cd_:

```
>>> let p = 'abcde';
>>> let q = 'cd';
>>> p.includesSubstring(q)
true
```

_12345_ includes _34_:

```
>>> let p = [1 2 3 4 5];
>>> let q = [3 4];
>>> p.includesSubstring(q)
true
```

This is the same as, though it can be more efficient than, asking if any of the substrings matches:

```
>>> let p = [1 2 3 4 5];
>>> let q = [3 4];
>>> p.substrings.select { :each |
>>> 	each = q
>>> }.isEmpty.not
true
```

_abcde_ does not include _ce_, which is a subsequence but not a substring:

```
>>> 'abcde'.includesSubstring('ce')
false

>>> [1 2 3 4 5].includesSubstring([3 5])
false
```

* * *

See also: includesSubsequence, substrings

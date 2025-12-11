# includesSubstring

- _includesSubstring(u, v)_

Answer `true` if the sequence _u_ includes the sequence _v_ as a substring (a contiguous subsequence).

_abcde_ includes _cd_:

```
>>> let p = 'abcde';
>>> let q = 'cd';
>>> p.includesSubstring(q)
true

>>> 'sequence as substring'
>>> .includesSubstring('string')
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

Find at last place:

```
>>> [0 1 1 0 0]
>>> .includesSubstring([0 0])
true
```

Do not find when not present:

```
>>> [0 1 0 1 0]
>>> .includesSubstring([0 0])
false
```

At `Range`:

```
>>> 1:100.includesSubstring(20:50)
true

>>> 1:10.includesSubstring(7:13)
false
```

* * *

See also: includes, includesSubsequence, substrings

Guides: String Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base-4.21.0.0/docs/Data-List.html#v:isInfixOf),
_W_
[1](https://en.wikipedia.org/wiki/Substring)

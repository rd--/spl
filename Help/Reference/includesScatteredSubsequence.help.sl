# includesScatteredSubsequence

- _includesScatteredSubsequence(u, v)_

Answer `true` if the sequence _u_ includes another sequence _v_ as a subsequence that is not a substring.

In _12345_ both _24_ and _125_ appear as scattered subsequences, _23_ does not:

```
>>> let p = [1 2 3 4 5];
>>> [2 4; 2 3; 1 2 5].collect { :each |
>>> 	p.includesScatteredSubsequence(each)
>>> }
[true false true]
```

* * *

See also: includesSubsequence, includesSubstring

Guides: List Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Subsequence)

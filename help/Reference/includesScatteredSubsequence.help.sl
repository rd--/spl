# includesScatteredSubsequence

- _includesScatteredSubsequence(aSequence, anotherSequence)_

Answer `true` if _aSequence_ includes _anotherSequence_ as a subsequence that is not a substring.

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

# isDissimilar

- _p !~ q_

Answer `true` if _p_ is not similar to (or not almost equal to) _q_,
else `false`.

```
>>> 0.1 !~ 0.2
true

>>> (0.1 ~ 0.2).not
true

>>> 0.1 !~ 0.10001
false
```

Where supported `!~` is displayed as ≉.

* * *

See also: Compare, Equal, <~, =, >~, ~, isClose, isSimilar, isVeryClose

Guides: Comparison Functions, Equality Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Not_Match)

Unicode: U+2249 ≉ Not Almost Equal To

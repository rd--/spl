# !~ (exclamationMarkTilde)

- _p !~ q_

Answer `true` if _p_ is not almost equal to (or not similar to) _q_, else `false`.
This is the operator form of `not` of `isCloseTo`.

```
>>> 0.1 !~ 0.2
true

>>> 0.1 !~ 0.10001
false
```

The name of this operator is `exclamationMarkTilde`.

* * *

See also: =, <~, >~, isCloseTo, isVeryCloseTo

Unicode: ≉ U+2249 Not Almost Equal To, ≁ U+2241 Not Tilde

References:
_Apl_
[1](https://aplwiki.com/wiki/Not_Match)

Categories: Comparing

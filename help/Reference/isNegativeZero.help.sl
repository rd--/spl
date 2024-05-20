# isNegativeZero

- _isNegativeZero(aNumber)_

Answer `true` if _aNumber_ is negative `zero`, else `false`.

```
>>> [-1 -0 0 1].collect(isNegativeZero:/1)
[false true false false]
```

Note that `zero` and negative zero compare equal at both `=` and `==`:

```
>>> 0 = -0
true

>>> 0 == -0
true
```

Note also that negative `zero` is not less than `zero`:

```
>>> -0 < 0
false
```

* * *

See also: =, ==, < isZero, isNegative

# isNegativeZero

- _isNegativeZero(x)_

Answer `true` if the number _x_ is negative `zero`, else `false`.

Threads over lists:

```
>>> [-1 -0 0 1].isNegativeZero
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

See also: =, ==, <, isZero, isNegative

Guides: Predicate Functions

Categories: Testing, Math

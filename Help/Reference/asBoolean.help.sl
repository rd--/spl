# asBoolean

- _asBoolean(x)_

Convert the object _x_ into a boolean value.

0 is `false`, 1 is `true`, `true` and `false` are themselves.

```
>>> 0.asBoolean
false

>>> 1.asBoolean
true

>>> false.asBoolean
false

>>> true.asBoolean
true
```

Integers other than `zero` and `one` signal an error:

```
>>> { -1.asBoolean }.hasError
true
```

To convert any non-zero number to `true` and `zero` to `false` use `!=`,
or `isNonZero`:

```
>>> [-1 -0.5 0 0.5 1]
>>> .collect { :x |
>>> 	x != 0
>>> }
[true true false true true]
```

Threads over lists:

```
>>> [0 false 1 true].asBoolean
[false false true true]
```

Inverses of `asBoolean` are `asBit` and `boole`.

* * *

See also: asBit, asInteger, boole, Boolean, isNonZero

Categories: Converting

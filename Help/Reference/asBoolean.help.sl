# asBoolean

- _asBoolean(aBoolean | anInteger)_

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
>>> { -1.asBoolean }.ifError { true }
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

Inverses of `asBoolean` are `asBit` and `boole`.

* * *

See also: asBit, asInteger, boole, Boolean, isNonZero

Categories: Converting

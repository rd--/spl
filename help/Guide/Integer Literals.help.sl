# Integer Literals

Integer literals evaluate to the type `SmallFloat`.

```
>>> 3.typeOf
'SmallFloat'
```

There is a `LargeInteger` type, written with an `n` suffix:

```
>>> 23n.isLargeInteger
true
```

and an `Integer` trait:

```
>>> [23, 23n].collect(isInteger:/1)
[true true]
```

There is a `Radix Syntax` for specifying non-decimal integers:

```
>>> [2r1010 8r12 10r10 16ra]
[10 10 10 10]
```

Leading zeros are allowed:

```
>>> [00 01 02 03 04 05 06 07 08 09]
[0 1 2 3 4 5 6 7 8 9]
```

* * *

See also: Integer, LargeInteger, Literals Syntax, Radix Syntax

Categories: Syntax

# Integer Literals

Integer literals evaluate to the type `SmallFloat`.

```
>>> 3.typeOf
'SmallFloat'
```

There is a `LargeInteger` type, written with an _L_ suffix:

```
>>> 23L.isLargeInteger
true
```

and an `Integer` trait:

```
>>> [23, 23L].collect(isInteger:/1)
[true true]
```

There is a `Radix Syntax` for specifying non-decimal integers:

```
>>> [2r1010 8r12 10r10 16rA]
[10 10 10 10]
```

Leading zeros are allowed:

```
>>> [00 01 02 03 04 05 06 07 08 09]
[0 1 2 3 4 5 6 7 8 9]
```

Leading signs, both negative and positive, are allowed:

```
>>> -1 * +1
-1
```

* * *

See also: Integer, LargeInteger, SmallFloat

Guides: Literals Syntax, Radix Syntax

Categories: Syntax

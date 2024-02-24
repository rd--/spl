# Integer Literals

Integer literals evaluate to the type `SmallFloat`.

```
>>> 3.typeOf
'SmallFloat'
```

There is a `LargeInteger` type:

```
>>> 23n.isLargeInteger
true
```

and an `Integer` trait:

```
>>> [23, 23n].collect(isInteger:/1)
[true true]
```

There is a `Radix Syntax` for specifying non-decimal integers.

```
>>> [2r1010 8r12 10r10 16ra]
[10 10 10 10]
```

* * *

See also: Integer, LargeInteger, Literals Syntax, Radix Syntax

Categories: Syntax

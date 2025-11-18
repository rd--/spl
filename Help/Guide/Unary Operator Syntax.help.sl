# Unary Operator Syntax

The grammar allows for operators to be written in ordinary method contexts.

In such contexts operators may have any arity that is defined for them.

Thus an operator can be a unary selector in `Method Syntax`:

```
>>> 3.-
-3

>>> 9.sqrt.-
-3

>>> -9.-.sqrt
3
```

or in a prefix name in `Apply Syntax`:

```
>>> -(sqrt(9))
-3
```

The translation is _3.- ⇒ hyphenMinus(3)  ⇒ hyphenMinus:/1 . (3)_.

Unary `+` is `conjugate`:

```
>>> [2J3 -4J-3 -12 1.5J1.5].+
[2J-3 -4J3 -12 1.5J-1.5]
```

Unary `*` is `sign`:

```
>>> [-3 0 3].*
[-1 0 1]
```

Unary `-` is `negate`:

```
>>> 3.-
-3

>>> [1 .. 9].-
[-1, -2 .. -9]

>>> 1:9.-.asList
[-1 -2 -3 -4 -5 -6 -7 -8 -9]
```

Unary `/` is `reciprocal`:

```
>>> 6.iota./
[1 0.5 0.333333 0.25 0.2 0.16667]
```

Unary `!` is `factorial`:

```
>>> 11.!
39916800
```

Unary operators are defined in the same manner as binary operators,
binding to blocks of one rather than two arguments.

* * *

See also: Binary Operator Syntax

Categories: Syntax

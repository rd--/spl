# Unary Operator Syntax

The grammar allows for a limited form or unary operators.

The last selector in a _dot_ message send may be an operator.

```
>>> 3.-
-3

>>> 9.sqrt.-
-3
```

The translation is _3.- ⇒ minus(3)  ⇒ minus:/1 . (3)_.

Unary + is sum:

```
>>> 1:9.+
45
```

Unary * is product:

```
>>> 1:9.*
362880
```

Unary - is negated:

```
>>> 3.-
-3

>>> 1:9.-
[-1 -2 -3 -4 -5 -6 -7 -8 -9]
```

Unary operators are defined in the same manner as binary operators,
binding to blocks of one rather than two arguments.

* * *

See also: [Binary Operator Syntax]

Categories: Syntax

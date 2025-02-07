# Operator Syntax

Operators are methods with lexically distinct names,
allowing them to be written in an _infix_ form in addition to the usual method application forms.

```
>>> 3 + 4
7

>>> +(3, 4)
7

>>> 3.+(4)
7
```

Written using the operator name:

```
>>> 3 plusSign: 4
7

>>> plusSign(3, 4)
7

>>> 3.plusSign(4)
7
```

When operators are written outside of `Apply Syntax` & `Method Syntax` they have an implicit arity of two:

```
>>> 1:9.reduce(+)
45

>>> 1:9.reduce(plusSign:/2)
45
```

Operators may, however, have any arity.
Many operators have distinct unary and binary forms:

```
>>> 3 - 4
-1

>>> 3.-
-3
```

There is no infix notation for ternary operators,
however they may be written using the ordinary method syntaxes:

```
>>> 3.*+(4, 5)
17

>>> *+(3, 4, 5)
17
```

* * *

See also: Operator List, Operator Names, Operator Syntax

Categories: Syntax, Operator

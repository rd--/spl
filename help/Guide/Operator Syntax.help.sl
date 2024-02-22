# Operator Syntax

Operators are methods with lexically distinct names.

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

When operators are written outside of `Apply Syntax & `Method Syntax` they have an implicit arity of two:

```
>>> 1:9.reduce(+)
45

>>> 1:9.reduce(plusSign:/2)
45
```

* * *

See also: Operator List, Operator Syntax


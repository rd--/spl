# asComplex

- _asComplex(x)_

Convert _x_ into a complex number.

In the `Number` case answer a `Complex` number with a real part of _x_ and an imaginary part of `zero`.

```
>>> 1.asComplex
1J0

>>> 1J0.real
1
```

In the two-element `List` case _[a b]_ answer _a+bi_:

```
>>> [2 3].asComplex
2J3

>>> 2J3.asList
[2 3]
```

In the `Complex` case answer `identity`.

```
>>> 1J1.asComplex
1J1
```

* * *

See also: asFloat, asInteger, asNumber, i

Categories: Converting

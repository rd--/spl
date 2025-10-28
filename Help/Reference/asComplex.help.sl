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

In the `Complex` case answer `identity`.

```
>>> 1J1.asComplex
1J1
```

Threads over lists:

```
>>> [1 2 3].asComplex
[1J0 2J0 3J0]
```

Convert a two-element `List` _[a b]_ into the complex number _a+bi_:

```
>>> [2 3].listToComplex
2J3

>>> 2J3.realImaginary
[2 3]
```

* * *

See also: asFloat, asInteger, asNumber, i

Guides: Number Functions

Categories: Converting

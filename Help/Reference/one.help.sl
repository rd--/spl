# one

- _one(x)_

Answer a unit value of the same type as the object _x_.

At `Complex`:

```
>>> (2 + 3I).one
Complex(1, 0)
```

At `Fraction`:

```
>>> let x = 1/3.one;
>>> (x, x.isFraction)
(1/1, true)
```

At `Float`:

```
>>> 3.141.one
1.0
```

At `Integer`:

```
>>> 23L.one
1L
```

At `Decimal`,
answers with the same `scale`:

```
>>> 3.141D.one
1.000D

>>> 1.000D.isOne
true
```

List answers with a unit collection of the same shape:

```
>>> [1 2 3; 4 5 6; 7 8 9].one
[1 1 1; 1 1 1; 1 1 1]
```

* * *

See also: isOne, zero

Guides: Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/1.html),
_W_
[1](https://en.wikipedia.org/wiki/1)

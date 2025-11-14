# one

- _one(x)_

Answer a unit value of the same type as the object _x_.

At `Complex`:

```
>>> (2 + 3.i).one
Complex(1, 0)
```

At `Fraction`:

```
>>> 1/3.one
Fraction(1, 1)
```

At `SmallFloat`:

```
>>> 3.141.one
1.0
```

At `LargeInteger`:

```
>>> 23L.one
1L
```

At `Decimal`:

```
>>> 3.141D.one
1D
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

Categories: Instance Creation

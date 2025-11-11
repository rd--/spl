# absSquare

- _absSquare(x)_

Answer the square of the absolute value of the number _x_.

At `SmallFloat`:

```
>>> -3.absSquare
9

>>> -3.abs.square
9
```

At `Complex`,
also known as the squared `norm`:

```
>>> 3J4.absSquare
25

>>> 3J4.abs.square
25

>>> [3 4].square.sum
25

>>> 3J4 * 3J4.conjugate
25
```

At `Quaternion`:

```
>>> Quaternion([1 2 3 4]).absSquare
30

>>> [1 2 3 4].square.sum
30
```

Threads over lists:

```
>>> [1J2 3J4].absSquare.sum
30

>>> [1J2 3J4].abs.square.sum
30
```

* * *

See also: abs, Complex, conjugate, square

Guides: Complex Number Functions, Quaternion Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AbsoluteSquare.html),
_Julia_
[1](https://docs.julialang.org/en/v1/base/math/#Base.abs2)

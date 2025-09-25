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

At `Complex`:

```
>>> 3J4.absSquare
25

>>> 3J4.abs.square
25

>>> [3 4].square.sum
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

See also: abs, Complex, square

Guides: Complex Number Functions, Quaternion Functions

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/math/#Base.abs2)

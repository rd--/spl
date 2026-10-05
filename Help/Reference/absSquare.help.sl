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
>>> [3J4 -1.5J0.5].absSquare
[25 2.5]

>>> [3J4 -1.5J0.5].squaredNorm
[25 2.5]

>>> [3J4 -1.5J0.5].abs.square
[25 2.5]

>>> [3J4 -1.5J0.5].collect { :z |
>>> 	z * z.conjugate
>>> }
[25 2.5]

>>> [3 -1.5; 4 0.5].square.sum
[25 2.5]
```

At `Quaternion`:

```
>>> Quaternion[1 2 3 4].absSquare
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

`absSquare` is an alias for `absoluteSquare`.

* * *

See also: abs, Complex, conjugate, square

Guides: Complex Number Functions, Quaternion Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AbsoluteSquare.html),
_Julia_
[1](https://docs.julialang.org/en/v1/base/math/#Base.abs2)

# pi

- _pi(n)_

Answer _n_ times `pi`,
the ratio of a circles circumference to its diameter,
also called Archimedes’ constant,
and approximately equal to _3.14159_.

```
>>> 1.pi
3.14159

>>> 2 * 1.arcSin
1.pi

>>> 2.pi
6.28319
```

`pi` threads over collections:

```
>>> [0.5, 1.5].pi
[1.5708, 4.71239]
```

It is common to write fractional values of `pi` using `Fraction Literals`,
which can be confusing if one is not aware of the distinction between _x / y_ and _x/y_:

```
>>> 1/2.pi
1.5708

>>> (1 / 2).pi
1.5708

>>> 1.pi / 2
1.5708

>>> 1 / 2.pi
0.15915
```

`pi` is not defined as a constant, unlike `Infinity` and `NaN`.

Where supported `pi` is displayed as π.

* * *

See also: e, Infinity, NaN

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Pi.html),
OEIS
[1](https://oeis.org/A000796),
_Smalltalk_
5.6.8.10,
_W_
[1](https://en.wikipedia.org/wiki/Pi)

Unicode: U+03C0 π Greek Small Letter Pi

Categories: Math, Constant

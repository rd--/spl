# pi

- _pi(aNumber)_

Answer _aNumber_ times `pi`,
the ratio of a circles circumference to its diameter,
approximately equal to _3.14159_.

```
>>> 1.pi
3.14159

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

`pi` is also defined as a constant, like `Infinity` and `NaN`:

```
>>> Pi * 2
2.pi
```

Where supported `pi` is displayed as π.

* * *

See also: e, Infinity, NaN

Guides: Mathematical Constants

References:
_Smalltalk_
5.6.8.10

Unicode: U+03C0 π Greek Small Letter Pi

Categories: Math, Constant

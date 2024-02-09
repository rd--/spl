# -

- _aNumber.-_
- _aNumber - anotherNumber_

The binary form answers _anotherNumber_ subtracted from _aNumber_.

```
>>> 10 - 3
7

>>> 1 - 0.3
0.7

>>> (6 - 1) - 2
3

>>> 6 - (1 - 2)
7
```

Subtracting complex numbers subtracts their components:

```
>>> 2j1 - 1j-1
1j2
```

Threads element-wise over lists:

```
>>> [1 2 3 4 5] - 0.5
[0.5 1.5 2.5 3.5 4.5]

>>> [-2 9 5] - [3 -4 6]
[-5 13 -1]

>>> (3 - [2 3 4.5]).sign
[1 0 -1]
```

As the argument to reduce and foldRight:

```
>>> [6 1 2].reduce(-)
((6 - 1) - 2)

>>> [6 1 2].foldRight(-)
(6 - (1 - 2))
```

The unary form answers the negation of _aNumber_:

```
>>> 3.-
-3

>>> 1:9.-
[-1 -2 -3 -4 -5 -6 -7 -8 -9]
```

The name of this operator is _hyphenMinus_.

* * *

See also: +, *, /

References:
_Apl_
[1](https://aplwiki.com/wiki/Subtract),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:-45-),
_Mathematica_
[1](https://mathworld.wolfram.com/Minus.html)
[2](https://reference.wolfram.com/language/ref/Subtract.html)
[3](https://reference.wolfram.com/language/ref/Minus.html)

Unicode: U+002D - Hyphen-minus, U+2010 ‐ Hyphen, U+2212 − Minus Sign

Categories: Mathematical operator

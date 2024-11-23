# / (solidus)

- _aNumber / anotherNumber_
- _aNumber./_

The binary form answers _aNumber_ divided by _anotherNumber_.

```
>>> 77 / 11
7

>>> 2 / 4
0.5

>>> 3j1 / 2
1.5j0.5
```

Divide threads element-wise over lists:

```
>>> [2 3 4 5] / 3
[2/3 1 4/3 5/3]

>>> [2 1 5] / [4 1 2]
[0.5 1 2.5]

>>> [3j1 2.5 4j5] / [2 1j1 0.2]
[1.5j0.5 1.25j-1.25 20j25]
```

Divide is applied sequentially:

```
>>> 3 / 5 / 7 / 9
(3 / (5 * 7 * 9))
```

At `LargeInteger` answers a `Fraction`:

```
>>> let r = 2n / 3n;
>>> (r, r.isFraction)
(2/3, true)
```

The unary form is `reciprocal`:

```
>>> 4./
0.25

>>> [2 4 8]./
[0.5 0.25 0.125]
```

Where supported `/` is displayed as ÷.

The name of this operator is `solidus`.

This glyph forms part of the `Fraction Literals` syntax:

```
>>> 616/33
Fraction(56, 3)

>>> 616 / 33
18.666
````

Integer division does not neccesarily answer an integer, c.f. `//`:

```
>>> 7 / 3
2.3333

>>> 7 // 3
2
```

* * *

See also: //, +, -, *

Guides: Fraction Literals

References:
_Apl_
[1](https://aplwiki.com/wiki/Divide),
_Haskell_
[1](https://hackage.haskell.org/package/base-4.19.1.0/docs/Prelude.html#v:-47-),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/percent),
_Mathematica_
[1](https://mathworld.wolfram.com/Division.html)
[2](https://reference.wolfram.com/language/ref/Divide.html),
_Smalltalk_
5.6.2.4
5.6.2.29

Unicode: U+0002F / Solidus, U+00F7 ÷ Division Sign

Categories: Math, Operator

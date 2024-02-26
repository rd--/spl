# /

- _aNumber./_
- _aNumber / anotherNumber_

Answer _aNumber_ divided by _anotherNumber_.

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

The unary form is _reciprocal_:

```
>>> 4./
0.25

>>> [2 4 8]./
[0.5 0.25 0.125]
```

The name of this operator is _solidus_.

This glyph forms part of the Fraction literal syntax:

```
>>> 616/33
Fraction(56, 3)

>>> 616 / 33
18.666
````

* * *

See also: +, -, *

Unicode: U+00F7 ÷ Division Sign

References:
_Apl_
[1](https://aplwiki.com/wiki/Divide),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/percent),
_Mathematica_
[1](https://mathworld.wolfram.com/Division.html)
[2](https://reference.wolfram.com/language/ref/Divide.html)

Categories: Math, Operator

# * (asterisk)

- _aNumber * anotherNumber_
- _aNumber.*_

The binary form answers _aNumber_ multiplied by _anotherNumber_.

```
>>> 2 * 3 * 4
24
```

Threads element-wise over lists:

```
>>> 2 * [3 4 5]
[6 8 10]

>>> [2 3 4] * 5
[10 15 20]

>>> [1 2 3] * [4 5 6]
[4 10 18]
```

Vector times matrix:

```
>>> [-1 0 1] * [1 2; 3 4; 5 6]
[[-1, -2], [0, 0], [5, 6]]

>>> [-1 1] * [1 2; 3 4; 5 6]
[-1 -2; 3 4; -5 -6]
```

Matrix times vector:

```
>>> [1 2; 3 4; 5 6] * [-1 0 1]
[-1 -2; 0 0; 5 6]

>>> [1 2; 3 4; 5 6] * [-1 1]
[-1 -2; 3 4; -5 -6]
```

Matrix times matrix:

```
>>> [1 2; 3 4] * [1 0; 3 2]
[1 0; 9 8]

>>> [1 2; 3 4; 5 6] * [-1 1; 0 0; 1 -1]
[-1 2; 0 0; 5 -6]

>>> [1 2; 3 4; 5 6] * [-1 1; 1 -1]
[-1 2; 3 -4; -5 6]
```

As argument to `reduce`:

```
>>> 1:9.reduce(*)
362880
```

Evaluate using both apply and method send syntaxes:

```
>>> *(3, 4)
12

>>> 3.*(4)
12
```

The unary form is `sign`:

```
>>> 1.pi.*
1

>>> [-3 0 3].*
[-1 0 1]
```

Where supported `*` is displayed as ×.

The name of this operator is `asterisk`.

* * *

See also: +, -, /, ^, sign, product

References:
_Apl_
[1](https://aplwiki.com/wiki/Times),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:-42-),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/star),
_Mathematica_
[1](https://mathworld.wolfram.com/Times.html)
[2](https://reference.wolfram.com/language/ref/Times.html),
_Smalltalk_
5.6.2.1

Unicode: U+00D7 × Multiplication Sign

Categories: Math, Operator

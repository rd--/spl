# - (hyphenMinus)

- _aNumber - anotherNumber_
- _aNumber.-_

The binary form answers _anotherNumber_ subtracted from _aNumber_,
or equally _aNumber_ plus the negation of _anotherNumber_.

```
>>> 10 - 3
7

>>> 10 + 3.negate
7

>>> 1 - 0.3
0.7

>>> (6 - 1) - 2
3

>>> 6 - (1 - 2)
7
```

Subtracting `Complex` numbers subtracts their components:

```
>>> 2J1 - 1J-1
1J2
```

Threads element-wise over lists:

```
>>> [1 2 3 4 5] - 0.5
[0.5 1.5 2.5 3.5 4.5]

>>> [-2 9 5] - [3 -4 6]
[-5 13 -1]

>>> (3 - [2 3 4.5]).sign
[1 0 -1]

>>> [1 2 3] - [4 5 6]
[-3 -3 -3]
```

As the argument to `reduce` and `foldRight`:

```
>>> [6 1 2].reduce(-)
(6 - 1) - 2

>>> [6 1 2].foldRight(-)
6 - (1 - 2)
```

The unary form is equivalent to `negate`, answering the negation of _aNumber_.

At `SmallFloat`:

```
>>> 3.-
-3

>>> -3.-
3
```

At `Range`:

```
>>> (1 .. 9).-
(-1 .. -9)

>>> (1, 3 .. 9).-
(-1, -3 .. -9)
```

At `LargeInteger`:

```
>>> 32L.!.-
-263130836933693530167218012160000000L
```

Threads over lists:

```
>>> [1 3 5 7 6 4 2].-
[-1 -3 -5 -7 -6 -4 -2]

>>> [0 1 2.2 3J4 4/5 -66].-
[-0 -1 -2.2 -3J-4 -4/5 66]

>>> [3 3].iota.-
[
	-1 -2 -3;
	-4 -5 -6;
	-7 -8 -9
]
```

Negation is its own inverse:

```
>>> 3.-.-
3

>>> 1:9.-.-
1:9

>>> [1 3 5].-.-
[1 3 5]
```

The name of this operator is `hyphenMinus`.

Where supported `-` is displayed as −.

* * *

See also: +, *, /, ^, Minus, negate

References:
_Apl_
[1](https://aplwiki.com/wiki/Subtract),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/minus),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:-45-),
_Mathematica_
[1](https://mathworld.wolfram.com/Minus.html)
[2](https://reference.wolfram.com/language/ref/Subtract.html)
[3](https://reference.wolfram.com/language/ref/Minus.html),
_Smalltalk_
5.6.2.3

Unicode: U+002D - Hyphen-minus, U+2010 ‐ Hyphen, U+2212 − Minus Sign

Categories: Math, Operator

# subtract

- _m - n_

Answers the number _n_ subtracted from _m_,
or equally _m_ plus the negation of _n_.
The operator form is `-`.

```
>>> 10 - 3
7

>>> 10 + -3
7

>>> 1 - 0.3
0.7

>>> (6 - 1) - 2
3

>>> 6 - (1 - 2)
7

>>> 5/7 - 3/4
-1/28
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

At `Symbol`:

```
>> `m` - `n`
(- m n)
```

* * *

See also: -, +, *, /, ^, negate

Guides: Arithmetic Functions, Binary Operators

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
5.6.2.3,
_W_
[1](https://en.wikipedia.org/wiki/Subtraction)

Categories: Math, Operator

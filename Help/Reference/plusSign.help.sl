# + (plusSign)

- _aNumber + anotherNumber_
- _aNumber.+_

The binary form answers the sum of _aNumber_ and _anotherNumber_.

```
>>> 3 + 4
7

>>> 1 + 2 + 3
6

>>> 1 + 2 + 3/4
15/4
```

`Complex` numbers add their components:

```
>>> 2J1 + 3J-7
5J-6
```

Plus threads element-wise over lists:

```
>>> 0.1 + [3 4 5]
[3.1 4.1 5.1]

>>> [1 2 3] + [2 3 4]
[3 5 7]

>>> [1 2 3] + [4 5 6]
[5 7 9]

>>> [1 2; 3 4; 5 6] + [[2 1]]
[3 3; 5 5; 7 7]
```

Plus at `SmallFloat` is not always associative:

```
>>> 1E20 + (-1E20 + 1)
0

>>> (1E20 + -1E20) + 1
1
```

The unary form of `+` is `conjugate`:

```
>>> [0 2 -1.1 1E300 -200].+
[0 2 -1.1 1E300 -200]

>>> [2J3 -4J-3 -12 1.5J1.5].+
[2J-3 -4J3 -12 1.5J-1.5]
```

The name of this operator is `plusSign`.

`+` is also a syntax token, see `Defining Methods`.

* * *

See also: -, *, /, conjugate, Plus, sum

Guides: Defining Methods

References:
_Apl_
[1](https://aplwiki.com/wiki/Add)
[2](https://aplwiki.com/wiki/Conjugate),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:-43-),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plus),
_Mathematica_
[1](https://mathworld.wolfram.com/Plus.html)
[2](https://reference.wolfram.com/language/ref/Plus.html),
_Smalltalk_
5.6.2.2

Unicode: U+002B + Plus Sign

Categories: Arithmetic, Math, Operator, Syntax

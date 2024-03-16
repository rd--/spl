# +

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
>>> 2j1 + 3j-7
5j-6
```

Plus threads element-wise over lists:

```
>>> 0.1 + [3 4 5]
[3.1 4.1 5.1]

>>> [1 2 3] + [2 3 4]
[3 5 7]
```

Plus at `SmallFloat` is not always associative:

```
>>> 1e20 + (-1e20 + 1)
0

>>> (1e20 + -1e20) + 1
1
```

The unary form of `+` is `conjugated`:

```
>>> [0 2 -1.1 1e300 -200].+
[0 2 -1.1 1e300 -200]

>>> [2j3 -4j-3 -12 1.5j1.5].+
[2j-3 -4j3 -12 1.5j-1.5]
```

The name of this operator is _plusSign_.

* * *

See also: -, *, /, conjugated, sum

Unicode: U+002B + Plus Sign

References:
_Apl_
[1](https://aplwiki.com/wiki/Add)
[2](https://aplwiki.com/wiki/Conjugate),
_Haskell_
[1](https://hackage.haskell.org/package/base-4.19.0.0/docs/Prelude.html#v:-43-),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plus),
_Mathematica_
[1](https://mathworld.wolfram.com/Plus.html)
[2](https://reference.wolfram.com/language/ref/Plus.html),
_Smalltalk_
5.6.2.2

Categories: Arithmetic, Math, Operator

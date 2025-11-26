# plus

- _m + n_

Answer the sum of the numbers _m_ and _n_.
The operator form is `+`.

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

At `Symbol`:

```
>> `m` + `n`
(+ m n)

>> `m`.+
(conjugate m)
```

* * *

See also: +, -, *, /, conjugate, sum

Guides: Binary Operators

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
5.6.2.2,
_W_
[1](https://en.wikipedia.org/wiki/Addition)

Categories: Arithmetic, Math, Operator

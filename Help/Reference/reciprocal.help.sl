# reciprocal

- _reciprocal(n)_

Answer `one` divided by `n`.
The operator form is `/`.

At `Integer`:

```
>>> 3.reciprocal
1/3

>>> 77 * 11./
77/11
```

At `Fraction`:

```
>>> 3/4.reciprocal
4/3
```

At `zero` and `inf`:

```
>>> Infinity.reciprocal
0

>>> 0.reciprocal
Infinity
```

Threads over lists:

```
>>> [2 4 8]./
[0.5 0.25 0.125]
```

* * *

See also: /, one

Guides: Arithmetic Functions, Unary Operators

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Reciprocal.html)
[2](https://mathworld.wolfram.com/MultiplicativeInverse.html),
_Smalltalk_
5.6.2.29,
_W_
[1](https://en.wikipedia.org/wiki/Multiplicative_inverse)
[2](https://en.wikipedia.org/wiki/Reciprocal_polynomial)

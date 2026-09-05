# ^ (circumflexAccent)

- _m ^ n_
- _n.^_

The binary form is `power`.

```
>>> 2L ^ 100L
power(2L, 100L)
```

The unary form is `exp`.

```
>>> 1.^
exp(1)
```

Where supported `^` is displayed as ˆ.

The name of this operator is `circumflexAccent`:

```
>>> 'm ^ n'.splSimplify
'circumflexAccent(m, n)'

>>> 'n.^'.splSimplify
'circumflexAccent(n)'
```

_Note:_
In Smalltalk ^ is the _return_ operator,
in C it is the _exclusive or_ operator.

* * *

See also: +, -, *, /, circumflexAccent, exp, power

Guides: Arithmetic Functions, Binary Operators

References:
_Apl_
[1](https://aplwiki.com/wiki/Power_(function)),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/hat#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/Power.html)
[2](https://reference.wolfram.com/language/ref/Power.html),
_OEIS_
[1](https://oeis.org/A000272),
_Smalltalk_
5.6.2.27,
_W_
[1](https://en.wikipedia.org/wiki/Exponentiation)

Categories: Math, Operator

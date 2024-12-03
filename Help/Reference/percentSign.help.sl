# % (percentSign)

- _aNumber % anotherNumber_

Answer the floating-point remainder of dividing _aNumber_ by _anotherNumber_.

_i % j_ is _i - n * j_, where _n_ is the quotient of _i / j_, rounded toward zero to an integer.

```
>>> 5 % 3
2

>>> 17 % 5
2
```

At negative numbers:

```
>>> (-5 % 3, -5 % 4)
(1, 3)
```

Rational numbers:

```
>>> 5/2 % 2
1/2
```

Real numbers:

```
>>> 28.sqrt % 3
(-3 + (2 * 7.sqrt))

>>> pi % 2
(-2 + pi)

>>> pi % 2
1.1416
```

`%` threads over lists:

```
>>> [1 2 3 4 5] % 3
[1 2 0 1 2]

>>> [-2 -1 0 1 2 3 4 5] % 2
[0 1 0 1 0 1 0 1]

>>> [5 10 14] % 3.5
[1.5 3 0]
```

For integers _a % m_ answers the _common residue_ of _a_ modulo _m_,
i.e. non-negative and smaller than _m_:

```
>>> [-2 -1 12 13] % 12
[10 11 0 1]
```

Plot the sequence with fixed modulus:

~~~spl svg=A
(1:50 % 8).linePlot
~~~

![](sw/spl/Help/Image/percentSign-A.svg)

Plot the sequence, varying the modulus:

~~~spl svg=B
(100 % 1:50).linePlot
~~~

![](sw/spl/Help/Image/percentSign-B.svg)

The name of this operator is `percentSign`.

* * *

See also: /, //, \\, minimalResidue, quotient, remainder

References:
_Apl_
[1](https://aplwiki.com/wiki/Residue),
_Mathematica_
[1](https://mathworld.wolfram.com/Mod.html)
[2](https://mathworld.wolfram.com/Congruence.html)
[3](https://mathworld.wolfram.com/CommonResidue.html)
[4](https://reference.wolfram.com/language/ref/Mod.html)

Categories: Math, Operator

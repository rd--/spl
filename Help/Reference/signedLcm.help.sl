# signedLcm

- _signedLcm(m, n)_

Signed least common multiple.

This definition extends the usual definition.
It returns a negative number if any of the operands is negative.
This makes it consistent with the lattice-theoretical interpretation
and it’s idempotency, commutative, associative, absorption laws.

```
>>> 1624.signedLcm(-26)
-21112

>>> 1624.lcm(-26)
21112

>>> -1624.signedLcm(-26)
-21112

>>> -1624.lcm(-26)
21112

>>> 513.signedLcm(513.signedGcd(44))
513

>>> 513.lcm(513.gcd(44))
513
```

Threads over lists:

```
>>> [4 1 1624 1624 -1624]
>>> .signedLcm([6 1 26 -26 -26])
[12 1 21112 -21112 -21112]
```

Inner square:

```
>>> signedLcm:/2
>>> .table(-3:3, -3:3)
[
	-3 -6 -3 -0 -3 -6 -3;
	-6 -2 -2 -0 -2 -2 -6;
	-3 -2 -1 -0 -1 -2 -3;
	-0 -0 -0  0  0  0  0;
	-3 -2 -1  0  1  2  3;
	-6 -2 -2  0  2  2  6;
	-3 -6 -3  0  3  6  3
]
```

Matrix plot of inner square,
indicates magnitude only,
equal to plot of `lcm`:

~~~spl svg=A
signedLcm:/2
.table(-6:6, -6:6)
.matrixPlot
~~~

![](Help/Image/signedLcm-A.svg)

* * *

See also: &&, gcd, signedGcd, lcm

Guides: Integer Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/LCM),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/stardot#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/LeastCommonMultiple.html)
[2](https://mathworld.wolfram.com/LCM.html),
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#lcm)

Further Reading: McDonnell 1975

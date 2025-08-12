# convergents

- _convergents(l)_

Answer a `List` of the convergents corresponding to the continued fraction terms in the list _l_.

```
>>> [0 1 5 2 2].convergents
[0 1/1 5/6 11/13 27/32]

>>> 27 / 32
0.84375

>>> (23 / 157).continuedFraction
[0 6 1 4 1 3]

>>> [0 6 1 4 1 3].convergents
[0 1/6 1/7 5/34 6/41 23/157]
```

Generate the first 10 convergents to `pi`:

```
>>> 1.pi
>>> .continuedFraction(10)
>>> .convergents
[
	3 22/7 333/106 355/113
	103993/33102 104348/33215
	208341/66317 312689/99532
	833719/265381 1146408/364913
]
```

Generate convergents from the continued fraction terms for `goldenRatio`:

```
>>> [1 1 1 1 1].convergents
[1 2 3/2 5/3 8/5]

>>> 1.goldenRatio
>>> .continuedFraction(10)
>>> .convergents
[
	1 2 3/2 5/3 8/5
	13/8 21/13 34/21 55/34 89/55
]

```

Quadratic irrationals have periodic continued fractions:

```
>>> 7.sqrt.continuedFraction(10)
[2 1 1 1 4 1 1 1 4 1]

>>> [2 1 1 1 4 1 1 1 4 1].convergents
[
	2 3 5/2 8/3 37/14
	45/17 82/31 127/48
	590/223 717/271
]
```

Give all convergents for a rational number:

```
>>> 7/17.continuedFraction(4)
>>> .convergents
[0 1/2 2/5 7/17]
```

Continue until the precision of the input is reached:

```
>>> 5.67567
>>> .continuedFraction(10)
>>> .convergents
[
	5 6 17/3 210/37 26897/4739
	27107/4776 54004/9515 81111/14291
	135115/23806 216226/38097
]
```

Continued fraction constants:

```
>>> [0 1 2 3 4 5 6 7].convergents
[
	0 1/1 2/3 7/10 30/43
	157/225 972/1393 6961/9976
]
```

* * *

See also: /, continuedFraction, fromContinuedFraction, rationalize, semiconvergents

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Convergent.html)
[2](https://mathworld.wolfram.com/ContinuedFractionConstants.html)
[3](https://reference.wolfram.com/language/ref/Convergents.html),
_OEIS_
[1](https://oeis.org/A001040)
[2](https://oeis.org/A001053)

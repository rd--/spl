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

Convergents of _√2_,
OEIS [A001333](https://oeis.org/A001333)
and
OEIS [A000129](https://oeis.org/A000129):

```
>>> 2.sqrt.continuedFraction(11).convergents
[
	1/1
	3/2
	7/5
	17/12
	41/29
	99/70
	239/169
	577/408
	1393/985
	3363/2378
	8119/5741
]

>>> linearRecurrence([2 1], [1 1], 12)
[1 1 3 7 17 41 99 239 577 1393 3363 8119]

>>> linearRecurrence([2 1], [0 1], 12)
[0 1 2 5 12 29 70 169 408 985 2378 5741]
```

Convergents of _√53_,
OEIS [A041090](https://oeis.org/A041090)
& [A041091](https://oeis.org/A041091):

```
>>> 53.sqrt.continuedFraction(14)
>>> .convergents
[
	7/1
	22/3
	29/4
	51/7
	182/25
	2599/357
	7979/1096
	10578/1453
	18557/2549
	66249/9100
	946043/129949
	2904378/398947
	3850421/528896
	6754799/927843
]
```

Numerators of convergents to _log₂(3)_,
OEIS [A005663](https://oeis.org/A005663):

```
>>> 3.log(2)
>>> .continuedFraction(16)
>>> .convergents
>>> .numerator
[
	1 2 3 8 19
	65 84 485 1054 24727
	50508 125743 176251 301994 16785921
	17087915
]
```

Denominators of convergents to _log₂(3)_,
OEIS [A005664](https://oeis.org/A005664):

```
>>> 3.log(2)
>>> .continuedFraction(16)
>>> .convergents
>>> .denominator
[
	1 1 2 5 12
	41 53 306 665 15601
	31867 79335 111202 190537 10590737
	10781274
]
```

Denominators of convergents to the reciprocal of _log₂(3)_,
OEIS [A046102](https://oeis.org/A046102):

```
>>> 3/2.log2
>>> .reciprocal
>>> .continuedFraction(16)
>>> .convergents
>>> .denominator
[
	1 1 3 7 24
	31 179 389 9126 18641
	46408 65049 111457 6195184 6306641
	31421748
]
```

Denominators of convergents to _log₂(5)/4_,
OEIS [A112732](https://oeis.org/A112732):

```
>>> (5.log2 / 4)
>>> .continuedFraction(16)
>>> .convergents
>>> .denominator
>>> .allButFirst
[
	1 2 5 7 12
	19 31 174 205 789
	2572 3361 9294 12655 97879
]
```

Convergents of the continued fraction of `exp` of one ninth:

```
>>> 1/9.exp.continuedFraction(13)
>>> .convergents
[
	1/1
	9/8
	10/9
	19/17
	504/451
	523/468
	1027/919
	45711/40904
	46738/41823
	92449/82727
	5778576/5170897
	5871025/5253624
	11649601/10424521
]
```

* * *

See also: /, continuedFraction, fromContinuedFraction, rationalize, semiconvergents

Guides: Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Convergent.html)
[2](https://mathworld.wolfram.com/ContinuedFractionConstants.html)
[3](https://reference.wolfram.com/language/ref/Convergents.html),
_OEIS_
[1](https://oeis.org/A001040)
[2](https://oeis.org/A001053)

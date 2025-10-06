# engelExpansion

- _engelExpansion(n/d)_

Answer the Engel expansion of the fraction _n/d_.

```
>>> 7/15.engelExpansion
[3 3 5]

>>> 4/13.engelExpansion
[4 5 7 13]

>>> 17/29.engelExpansion
[2 6 29]

>>> 8/11.engelExpansion
[2 3 3 11]
```

Expansion for an approximation of π,
OEIS [A006784](https://oeis.org/A006784),
the expansion of an approximation diverges rapidly from the true sequence:

```
>>> 3.14159265358979D.asFraction
>>> .engelExpansion
[
	1 1 1 8 8
	17 19 300 1991 2768
	4442 4830 10560 37132 107315
	244141 651042 1953125
]
```

Expansion for an approximation of _e_,
OEIS [A000027](https://oeis.org/A000027),
the true sequence is one followed by the natural numbers:

```
>>> 2.71828182845904D.asFraction
>>> .engelExpansion
[
	1 1 2 3 4
	5 6 7 8 9
	10 11 12 13 14
	15 17 82 144 321
	2289 9041 21083 474060 887785
	976563 1953125
]
```

Expansion for an approximation of _√2_,
OEIS [A028254](https://oeis.org/A028254):

```
>>> 1.414213562373095D.asFraction
>>> .engelExpansion
[
	1 3 5 5 16
	18 78 102 120 144
	260 968 18531 46065 63005
	65105 78125
]
```

* * *

See also: sylvesterExpansion

Guides: Fraction Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EngelExpansion.html),
_OEIS_
[1](https://oeis.org/A006784)
[2](https://oeis.org/A000027)
[3](https://oeis.org/A028254),
_W_
[1](https://en.wikipedia.org/wiki/Engel_expansion)

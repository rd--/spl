# conwaysConstant

- _conwaysConstant(n)_

Answer _n_ times Conways’s constant λ.

```
>>> 1.conwaysConstant
1.30358
```

It is the solution to the following univariate polynomial:

```
>>> UnivariatePolynomial(
>>> 	[
>>> 		-6 3 -6 12 -4 7 -7 1 0 5
>>> 		-2 -4 -12 2 7 12 -7 -10 -4 3
>>> 		9 -7 0 -8 14 -3 9 2 -3 -10
>>> 		-2 -6 1 10 -3 1 7 -7 7 -12
>>> 		-5 8 6 10 -8 -8 -7 -3 9 1
>>> 		6 6 -2 -3 -10 -2 3 5 2 -1
>>> 		-1 -1 -1 -1 1 2 2 -1 -2 -1
>>> 		0 1
>>> 	]
>>> ).at(1.conwaysConstant)
0
```

Continued fraction:

```
>>> 1.conwaysConstant
>>> .continuedFraction(15)
[1 3 3 2 2 54 5 2 1 16 1 30 1 1 1]

>>> 73 / 56
1.30357
```

* * *

See also: lookAndSaySequence

Guides: Mathematical Constants

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConwaysConstant.html),
_OEIS_
[1](https://oeis.org/A014715)

# unitaryDivisors

- _unitaryDivisors(n)_

Answer the unitary divisors of the integer _n_.

```
>>> 12.unitaryDivisors
[1 3 4 12]

>>> 120.unitaryDivisors
[1 3 5 8 15 24 40 120]
```

The first few terms,
OEIS [A077610](https://oeis.org/A077610):

```
>>> 1:15.collect(unitaryDivisors:/1)
[
	1;
	1 2;
	1 3;
	1 4;
	1 5;
	1 2 3 6;
	1 7;
	1 8;
	1 9;
	1 2 5 10;
	1 11;
	1 3 4 12;
	1 13;
	1 2 7 14;
	1 3 5 15
]
```

Sum of unitary divisors of n is a square,
OEIS [A063937](https://oeis.org/A063937):

```
>>> 2:200.select { :n |
>>> 	let m = n.unitaryDivisors.sum;
>>> 	m.sqrt.isInteger
>>> }
[
	  3   8  22  24  66
	 70  76  94 115 119
	170
]
```

Plot first few terms:

~~~spl svg=A
1:65.collect(unitaryDivisors:/1)
.catenate
.scatterPlot
~~~

![](sw/spl/Help/Image/unitaryDivisors-A.svg)

* * *

See also: divisors, unitaryDivisorSigma

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitaryDivisor.html),
_OEIS_
[1](https://oeis.org/A077610)
[2](https://oeis.org/A063937),
_Python_
[1](https://docs.sympy.org/latest/modules/ntheory.html#sympy.ntheory.factor_.udivisors),
_W_
[1](https://en.wikipedia.org/wiki/Unitary_divisor)

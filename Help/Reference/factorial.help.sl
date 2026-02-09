# factorial

- _factorial(n)_

The `product` of the integers from `one` up to _n_.

```
>>> 5.factorial
[1 .. 5].product

>>> 9.factorial
1:9.product

>>> 18.factorial
6402373705728000

>>> 23L.factorial
25852016738884976640000L
```

Threads over lists,
OEIS [A000142](https://oeis.org/A000142):

```
>>> 1:10.factorial
[
	1 2 6 24 120
	720 5040 40320
	362880 3628800
]
```

Number of permutations of 6 elements:

```
>>> [1 .. 6].permutations.size
720

>>> 6.factorial
720
```

Exact `LargeInteger` and inexact `SmallFloat` results for 30! and 47!:

```
>>> 30L.factorial
265252859812191058636308480000000L

>>> 30.factorial
2.652528598121911E32

>>> 47L.factorial
(
	[
		258623241511168L
		180642964355153L
		611979969197632L
		389120000000000L
	] * (10L ^ [45 30 15 0])
).sum

>>> 47.factorial
2.586232415111682E59
```

Notable limits, the largest factorials that can fit into a specified type

- 12!: 32-bit integer
- 18!: 53-bit integer
- 20!: 64-bit integer.
- 170!: 64-bit double.

```
>>> 12.factorial.log2.floor
28

>>> 18.factorial.log2.floor
52

>>> 20.factorial.log2.floor
61
```

At `SmallFloat` factorial is accurate to 15 digits:

```
>>> 23.factorial
258520167388849E8

>>> 23L.factorial
25852016738884976640000L
```

Factorial of matrix elements:

```
>>> [0 1 2; 3 4 5].factorial
[
	1   1   2;
	6  24 120
]
```

At `zero`:

```
>>> 0.factorial
1
```

Calculate the third to twelfth terms of OEIS [A000435](https://oeis.org/A000435):

```
>>> 3:12.collect { :n |
>>> 	(n - 1).factorial
>>> 	*
>>> 	[0 .. n - 2].collect { :k |
>>> 		n ^ k / k.factorial
>>> 	}.sum
>>> }
[
	8 78 944 13800 237432
	4708144 105822432 2660215680
	73983185000 2255828154624
]
```

The reciprocals of factorials produce a convergent series for `e`:

```
>>> 0:17.!./.sum
1.e
```

Relation to `gamma`:

```
>>> let n = 23;
>>> n.factorial = (n + 1).gamma
true
```

Robbins numbers,
OEIS [A005130](https://oeis.org/A005130):

```
>>> 1:17.collect { :n |
>>> 	let m = n - 1;
>>> 	0:m.product { :k |
>>> 		(3 * k + 1).factorial
>>> 		\
>>> 		(n + k).factorial
>>> 	}
>>> }
[
	1
	2
	7
	42
	429
	7436
	218348
	10850216
	911835460
	129534272700
	31095744852375
	12611311859677500L
	8639383518297652500L
	9995541355448167482000L
	19529076234661277104897200L
	64427185703425689356896743840L
	358869201916137601447486156417296L
]
```

Irregular triangular array of Motzkin polynomial coefficients,
OEIS [A055151](https://oeis.org/A055151):

```
>>> 0:9.triangularArray { :n :k |
>>> 	(k < 0 | { 2 * k > n }).if {
>>> 		nil
>>> 	} {
>>> 		let a = n - (2 * k);
>>> 		n.! / (a.! * k.! * (k + 1).!)
>>> 	}
>>> }.deleteMissing(2)
[
	1;
	1;
	1  1;
	1  3;
	1  6   2;
	1 10  10;
	1 15  30   5;
	1 21  70  35;
	1 28 140 140  14;
	1 36 252 420 126
]
```

Count partitions into lists of lists,
OEIS [A002866](https://oeis.org/A002866):

```
>>> 1:8.collect { :n |
>>> 	2 ^ (n - 1) * n.!
>>> }
[1 4 24 192 1920 23040 322560 5160960]
```

Least factorial multiple of _n_,
OEIS [A092495](https://oeis.org/A092495):

```
>>> let f = 1:30.!;
>>> 1:28.collect { :n |
>>> 	f.detect { :x |
>>> 		x.divisible(n)
>>> 	}
>>> }
[
	1 2 6 24 120 6 5040 24 720 120
	39916800 24 6227020800 5040 120
	720 355687428096000L 720
	121645100408832000L 120 5040
	39916800 25852016738884976640000L
	24 3628800 6227020800 362880 5040
]
```

_n*n!+1=(n+1)!-n!+1_,
OEIS [A188914](https://oeis.org/A188914):

```
>>> 0:8.collect { :n | (n * n.!) + 1 }
[1 2 5 19 97 601 4321 35281 322561]

>>> 0:8.collect { :n | (n + 1).! - n.! + 1 }
[1 2 5 19 97 601 4321 35281 322561]
```

Primes of the form _n!-(n-1)!+1_,
OEIS [A049984](https://oeis.org/A049984):

```
>>> 0:13.collect { :n | (n * n.!) + 1 }
>>> .select(isPrime:/1)
[2 5 19 97 601 35281 5748019201]
```

Left factorials,
OEIS [A003422](https://oeis.org/A003422):

```
>>> 0:9.!.prefixSum
[1 2 4 10 34 154 874 5914 46234 409114]
```

Number of connected permutations,
also called indecomposable permutations or irreducible permutations,
OEIS [A003319](https://oeis.org/A003319):

```
>>> let a = { :n |
>>> 	let m = n - 1;
>>> 	n.! - 1:m.sum { :k |
>>> 		k.! * a(n - k)
>>> 	}
>>> };
>>> 1:12.collect(a:/1)
[
	1 1 3 13 71 461 3447 29093 273343
	2829325 31998903 392743957
]
```

The [Kempner_function](https://en.wikipedia.org/wiki/Kempner_function),
also sometimes called the Smarandache function or Kempner numbers,
the smallest positive integer _m_ such that _n_ divides _m!_,
OEIS [A002034](https://oeis.org/A002034):

~~~spl svg=A
1:100.collect { :n |
	let m = 1;
	{
		m.!.divisible(n)
	}.whileFalse {
		m := m + 1
	};
	m
}.stepPlot
~~~

![](sw/spl/Help/Image/factorial-A.svg)

* * *

See also: !, binomial, doubleFactorial, factorialOrGamma, factorialPower, gamma, pochhammer, subfactorial

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Factorial),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bang),
_Mathematica_
[1](https://mathworld.wolfram.com/Factorial.html)
[2](https://reference.wolfram.com/language/ref/Factorial.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/factorial.html),
_OEIS_
[1](https://oeis.org/A000142)
[2](https://oeis.org/A000435)
[3](https://oeis.org/A005130)
[4](https://oeis.org/A055151),
_Smalltalk_
5.6.5.11,
_W_
[1](https://en.wikipedia.org/wiki/Factorial)

Categories: Math, Combinatorics

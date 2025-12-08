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

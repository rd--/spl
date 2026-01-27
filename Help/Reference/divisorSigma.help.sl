# divisorSigma

- _divisorSigma(k, n)_

Answer the divisor function _σk(n)_.

`divisorSigma` is also known as the divisor function or sum-of-divisors function.

_divisorSigma(k, n)_ is the sum of the _k_-th powers of the divisors of _n_.

Find the divisors of twenty:

```
>>> 20.divisors
[1 2 4 5 10 20]
```

The number of divisors:

```
>>> 0.divisorSigma(20)
6
```

The size of the `divisors` is equal to `divisorSigma` of `zero`:

```
>>> [60 1729 8640].collect { :each |
>>> 	[
>>> 		each.divisors.size,
>>> 		0.divisorSigma(each)
>>> 	]
>>> }
[12 12; 8 8; 56 56]
```

The sum of divisors:

```
>>> 1.divisorSigma(20)
42
```

The sum of squares of divisors:

```
>>> 2.divisorSigma(20)
546
```

At `Integer`:

```
>>> 2.divisorSigma(6)
50
```

Negative powers:

```
>>> -1.divisorSigma(12)
7/3

>>> -2.divisorSigma(10)
(13 / 10)
```

Rational powers:

```
>>> (1 / 2).divisorSigma(12)
(
	(2 * (-1 + (2 * 2.sqrt)))
	/
	((-1 + 2.sqrt) * (-1 + 3.sqrt))
)
```

Threads elementwise over lists:

```
>>> 0.divisorSigma(1:5)
[1 2 2 3 2]

>>> 1.divisorSigma(1:5)
[1 3 4 7 6]

>>> 2.divisorSigma(1:5)
[1 5 10 21 26]
```

First few terms at _k=0_,
OEIS [A000005](https://oeis.org/A000005):

```
>>> 0.divisorSigma(1:40)
[
	1 2 2 3 2 4 2 4 3 4
	2 6 2 4 4 5 2 6 2 6
	4 4 2 8 3 4 4 6 2 8
	2 6 4 4 4 9 2 4 4 8
]
```

Recognize perfect numbers, numbers _n_ such that the sum of their divisors is equal to _2n_:

```
>>> 1:30.select { :n |
>>> 	1.divisorSigma(n) = (2 * n)
>>> }
[6 28]
```

Deficient numbers, numbers _n_ such that the sum of their divisors is smaller than _2n_:

```
>>> 1:30.select { :n |
>>> 	1.divisorSigma(n) < (2 * n)
>>> }
[
	01 02 03 04 05 07 08 09 10 11
	13 14 15 16 17 19 21 22 23 25
	26 27 29
]
```

Abundant numbers, numbers _n_ such that the sum of their divisors is greater than _2n_:

```
>>> 1:30.select { :n |
>>> 	1.divisorSigma(n) > (2 * n)
>>> }
[12 18 20 24 30]
```

Calculate the divisor summatory function,
OEIS [A006218](https://oeis.org/A006218):

```
>>> 0.divisorSigma(1:39).foldList(0, +)
[
	  0   1   3   5   8
	 10  14  16  20  23
	 27  29  35  37  41
	 45  50  52  58  60
	 66  70  74  76  84
	 87  91  95 101 103
	111 113 119 123 127
	131 140 142 146 150
]
```

The aliquot numbers
OEIS [A078923](https://oeis.org/A078923),
and the nonaliquot numbers
OEIS [A005114](https://oeis.org/A005114):

```
>>> let sigma:/1 = { :n |
>>> 	1.divisorSigma(n)
>>> }.memoize(true);
>>> 0:11.groupBy { :n |
>>> 	let m = (n = 1).if {
>>> 		2
>>> 	} {
>>> 		(n - 1) ^ 2
>>> 	};
>>> 	1:m.anySatisfy { :k |
>>> 		sigma(k) - k = n
>>> 	}
>>> }
[
	true: [0 1 3 4 6 7 8 9 10 11],
	false: [2 5]
]
```

Select _n_ where the cube of the number of divisors of _n_ is larger than _n_,
OEIS [A056757](https://oeis.org/A056757):

```
>>> 1:99.select { :n |
>>> 	0.divisorSigma(n) ^ 3 > n
>>> }
[
	 2  3  4  5  6  7  8  9 10 12
	14 15 16 18 20 21 22 24 25 26
	27 28 30 32 33 34 35 36 38 39
	40 42 44 45 46 48 50 51 52 54
	55 56 57 58 60 62 63 64 66 68
	70 72 75 76 78 80 81 84 88 90
	92 96 98 99
]
```

Prefix sum,
OEIS [A024916](https://oeis.org/A024916):

```
>>> accumulate(divisorSigma(1, 1:49))
[
	   1    4    8   15   21
	  33   41   56   69   87
	  99  127  141  165  189
	 220  238  277  297  339
	 371  407  431  491  522
	 564  604  660  690  762
	 794  857  905  959 1007
	1098 1136 1196 1252 1342
	1384 1480 1524 1608 1686
	1758 1806 1930 1987
]
```

Arithmetic numbers,
OEIS [A003601](https://oeis.org/A003601):

```
>>> 1:99.select { :n |
>>> 	let tau = 0.divisorSigma(n);
>>> 	let sigma = 1.divisorSigma(n);
>>> 	(sigma / tau).isInteger
>>> }
[
	 1  3  5  6  7 11 13 14 15 17
	19 20 21 22 23 27 29 30 31 33
	35 37 38 39 41 42 43 44 45 46
	47 49 51 53 54 55 56 57 59 60
	61 62 65 66 67 68 69 70 71 73
	77 78 79 83 85 86 87 89 91 92
	93 94 95 96 97 99
]
```

Antiharmonic numbers,
OEIS [A020487](https://oeis.org/A020487):

```
>>> 1:200.select { :n |
>>> 	let a = 1.divisorSigma(n);
>>> 	let b = 2.divisorSigma(n);
>>> 	b.divisible(a)
>>> }
[
	  1   4   9  16  20
	 25  36  49  50  64
	 81 100 117 121 144
	169 180 196 200
]
```

Harmonic means of divisors of harmonic numbers,
OEIS [A001600](https://oeis.org/A001600):

```
>>> 1:500.collect { :n |
>>> 	let tau = 0.divisorSigma(n);
>>> 	let sigma = 1.divisorSigma(n);
>>> 	n * tau / sigma
>>> }.select(isInteger:/1)
[1 2 3 5 6 5]
```

Plot divisor function _σ₀(n)_ up to _n=100_,
OEIS [A000005](https://oeis.org/A000005):

~~~spl svg=A
1:100.functionPlot { :x |
	0.divisorSigma(x)
}
~~~

![](sw/spl/Help/Image/divisorSigma-A.svg)

Plot divisor function _σ₁(n)_ up to _n=100_:

~~~spl svg=B
1:100.functionPlot { :x |
	1.divisorSigma(x)
}
~~~

![](sw/spl/Help/Image/divisorSigma-B.svg)

Plot the log of the divisor function _σ₂(n)_ up to _n=100_:

~~~spl svg=C
1:100.functionPlot { :x |
	2.divisorSigma(x).log
}
~~~

![](sw/spl/Help/Image/divisorSigma-C.svg)

Scatter plot of _σ₀(n)_, also called _τ(n)_:

~~~spl svg=D
let n = 200;
0.divisorSigma(1:n).scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-D.svg)

Number of divisors of _n_ that are at most _√n_,
OEIS [A038548](http://oeis.org/A038548):

```
>>> 1:105.collect { :n |
>>> 	(0.divisorSigma(n) + 1) / 2
>>> }.floor
[
	1 1 1 2 1 2 1 2 2 2 1 3 1 2 2 3 1 3 1
	3 2 2 1 4 2 2 2 3 1 4 1 3 2 2 2 5 1 2
	2 4 1 4 1 3 3 2 1 5 2 3 2 3 1 4 2 4 2
	2 1 6 1 2 3 4 2 4 1 3 2 4 1 6 1 2 3 3
	2 4 1 5 3 2 1 6 2 2 2 4 1 6 2 3 2 2 2
	6 1 3 3 5 1 4 1 4 4
]
```

Plot of
OEIS [A038548](http://oeis.org/A038548):

~~~spl svg=E
1:85.collect { :n |
	(0.divisorSigma(n) + 1) / 2
}.floor.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-E.svg)

Plot smallest _k_ such that _σ(k)=n_, or zero if there is no such _k_,
OEIS [A051444](https://oeis.org/A051444):

~~~spl svg=F
let m = 10 ^ 2;
1:89.collect { :n |
	let k = 1;
	{
		1.divisorSigma(k) != n & {
			k < m
		}
	}.whileTrue {
		k := k + 1
	};
	(k = m).if { 0 } { k }
}.scatterPlot
~~~

![](sw/spl/Help/Image/divisorSigma-F.svg)

* * *

See also: aliquotSum, divisible, divisors, divisorSum, divisorSummatoryFunction, eulerPhi, isAbundantNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DivisorFunction.html)
[2](https://reference.wolfram.com/language/ref/DivisorSigma.html),
_OEIS_
[1](https://oeis.org/A000005)
[2](https://oeis.org/A000203)
[3](https://oeis.org/A078923)
[4](https://oeis.org/A005114),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.divisor_sigma),
_W_
[1](https://en.wikipedia.org/wiki/Divisor_function)

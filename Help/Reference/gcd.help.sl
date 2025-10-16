# gcd

- _gcd(n₁, n₂)_
- _gcd([n₁ n₂ …])_

Answer the greatest common divisor of _n_,
the largest positive integer that divides each of the integers _n_.

Table for small _n_:

```
>>> gcd:/2.table(2:4, 1:10)
[
	1 2 1 2 1 2 1 2 1 2;
	1 1 3 1 1 3 1 1 3 1;
	1 2 1 4 1 2 1 4 1 2
]
```

The binary form:

```
>>> 0.gcd(9)
9

>>> 4.gcd(6)
2

>>> 0.gcd(1)
1

>>> 1024.gcd(256)
256

>>> 1024.gcd(-256)
256

>>> 66.gcd(54) * 66.lcm(54)
66 * 54
```

The unary form:

```
>>> [2 6 10].gcd
2

>>> [2 6 10].reduce(gcd:/2)
2

>>> [-12 9 57].gcd
3

>>> [1/3 2/5 3/7].gcd
1/105
```

The unary, or one-argument, form is identity for positive integers & `zero` for empty collections:

```
>>> [5].gcd
5

>>> [].gcd
0
```

Gcd threads elementwise over lists:

```
>>> [3 7 40].collect { :each |
>>> 	12.gcd(each)
>>> }
[3 1 4]

>>> [3 7 40].gcd(12)
[3 1 4]

>>> 12.gcd([3 7 40])
[3 1 4]
```

Compute for large integers:

```
>>> [20L.factorial, 10L ^ 100 + 3].gcd
7L
```

In a divisibility network, two numbers are connected if they share a common divisor:

```
>>> 1:9.tuples(2).select { :each |
>>> 	let [i, j] = each;
>>> 	i < j & {
>>> 		i.gcd(j) > 1
>>> 	}
>>> }
[2 4; 2 6; 2 8; 3 6; 3 9; 4 6; 4 8; 6 8; 6 9]
```

For `zero` and `one`, `gcd` is analogous to logical or:

```
>>> gcd:/2.table([0 1], [0 1])
[0 1; 1 1]

>>> ||.table([false true], [false true])
[false true; true true]
```

Real rational numbers:

```
>>> [1/3 2/5 3/7].gcd
1/105
```

Table of the first one hundred integers:

```
>>> gcd:/2.table(1:10, 1:10)
[
	1  1  1  1  1  1  1  1  1  1;
	1  2  1  2  1  2  1  2  1  2;
	1  1  3  1  1  3  1  1  3  1;
	1  2  1  4  1  2  1  4  1  2;
	1  1  1  1  5  1  1  1  1  5;
	1  2  3  2  1  6  1  2  3  2;
	1  1  1  1  1  1  7  1  1  1;
	1  2  1  4  1  2  1  8  1  2;
	1  1  3  1  1  3  1  1  9  1;
	1  2  1  2  5  2  1  2  1 10
]
```

Use `eulerPhi` to compute `gcd`:

```
>>> 24.divisors
>>> .intersection(12.divisors)
>>> .collect(eulerPhi:/1)
>>> .sum
12

>>> 24.gcd(12)
12
```

The determinant of the matrix of pairwise greatest common divisors is related to Euler’s totient function:

```
>>> 1:6.collect { :n |
>>> 	outer(gcd:/2, 1:n, 1:n)
>>> 	.determinant
>>> }
[1 1 2 4 16 32]

>>> 1:6.collect { :n |
>>> 	1:n.product(eulerPhi:/1)
>>> }
[1 1 2 4 16 32]
```

Eleven-rough numbers,
numbers not divisible by 2, 3, 5 or 7,
OEIS [A008364](https://oeis.org/A008364):

```
>>> 1:150.select { :x |
>>> 	x.gcd(210) = 1
>>> }
[
	  1  11  13  17  19
	 23  29  31  37  41
	 43  47  53  59  61
	 67  71  73  79  83
	 89  97 101 103 107
	109 113 121 127 131
	137 139 143 149
]
```

Plot the gcd for a number with 12:

~~~spl svg=A
1:72.functionPlot { :x | x.gcd(12) }
~~~

![](sw/spl/Help/Image/gcd-A.svg)

Matrix plot of table:

~~~spl png=B
(1 - gcd:/2.table(1:100, 1:100).rescale)
.Graymap
~~~

![](sw/spl/Help/Image/gcd-B.png)

Fibonacci numbers:

~~~spl png=C
let n = 100.fibonacciSequence;
let m = { :j :k |
	n[j].gcd(n[k])
}.table(1:100, 1:100);
(1 - (m % n[11]).rescale)
.Graymap
~~~

![](sw/spl/Help/Image/gcd-C.png)

Form the greatest common divisors of one with rational numbers:

~~~spl svg=D
17.fareySequence.collect { :n |
	1.gcd(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/gcd-D.svg)

* * *

See also: ||, chineseRemainder, divisible, euclideanAlgorithm, extendedGcd, Fraction, isCoprime, isPrime, lcm

Guides: Integer Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/GCD),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:gcd),
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestCommonDivisor.html)
[2](https://mathworld.wolfram.com/GCD.html)
[3](https://reference.wolfram.com/language/ref/PolynomialGCD.html),
_OEIS_
[1](https://oeis.org/A008364),
_Smalltalk_
5.6.5.12,
_W_
[1](https://en.wikipedia.org/wiki/Greatest_common_divisor)
[2](https://en.wikipedia.org/wiki/Polynomial_greatest_common_divisor)

Categories: Arithmetic

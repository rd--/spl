# mod

- _mod(m, n, d=0)_

Answer the remainder on division of _m_ by _n_ using offset _d_.
In the case where _d=0_ the operator form is `%`.

Modulo table:

```
>>> %.swap.table(1:4, 1:10)
[
	0 0 0 0 0 0 0 0 0 0;
	1 0 1 0 1 0 1 0 1 0;
	1 2 0 1 2 0 1 2 0 1;
	1 2 3 0 1 2 3 0 1 2
]
```

Compute five modulo three:

```
>>> 5 % 3
2
```

At integer _m_ and _n_:

```
>>> (5 % 3, 5.mod(3))
(2, 2)

>>> (17 % 5, 17.mod(5))
(2, 2)
```

A number modulo itself is `zero`:

```
>>> (5 % 5, 5.mod(5))
(0, 0)
```

Zero modulo any number is `zero`:

```
>>> 0 % 5
0
```

_m%n_ is _m-qn_, where _q_ is the quotient of _m/n_, rounded toward zero to an integer:

```
>>> let [m, n] = [5, 3];
>>> m - ((m / n).floor * n)
2
```

At negative _m_:

```
>>> (-5 % 3, -5 % 4, -1 % 3)
(1, 3, 2)
```

At negative _n_, relation to `\\`:

```
>>> (19 % 12, 19 % -12)
(7, -5)

>>> (19 \\ 12, 19 \\ -12)
(7, 7)
```

At `LargeInteger`:

```
>>> -3213213213213213432453243L
>>> %
>>> -123434343439L
-26953727934L
```

At `Fraction`:

```
>>> 5/2 % 2
1/2
```

Real numbers,
for positive _n_ answer the floating-point remainder of dividing _m_ by _n_:

```
>>> 28.sqrt % 3
(-3 + (2 * 7.sqrt))

>>> 1.pi % 2
(-2 + 1.pi)

>>> (1.pi % 2, 1.pi % -2)
(1.1416, -0.8584)

>>> 1.5 % 1
0.5

>>> -0.5 % 1
0.5
```

`%` threads over lists:

```
>>> [1 2 3 4 5] % 3
[1 2 0 1 2]

>>> [-2 -1 0 1 2 3 4 5] % 2
[0 1 0 1 0 1 0 1]

>>> [5 10 14] % 3.5
[1.5 3 0]
```

For integers,
_a % m_ answers the _common residue_ of _a_ modulo _m_,
i.e. non-negative and smaller than _m_:

```
>>> [-2 -1 12 13] % 12
[10 11 0 1]
```

Fermats little theorem:

```
>>> 7.gcd(11)
1

>>> 7 ^ (11 - 1) % 12
1
```

Eulers theorem:

```
>>> 7.gcd(12)
1

>>> 7 ^ 12.eulerPhi % 12
1
```

`%` is transitive:

```
>>> (5 % 3) = (2 % 3)
true

>>> (2 % 3) = (8 % 3)
true

>>> (8 % 3) = (5 % 3)
true
```

If _n_ divides _m_ then _m % n = 0_:

```
>>> 8.divisible(2)
true

>>> 8 % 2
0
```

For positive _n_,
the second part of the `quotientRemainder` is the same as `%`:

```
>>> 17.quotientRemainder(6)
[2 5]

>>> 17 % 6
5

>>> 17.quotientRemainder(-6)
[-2 5]

>>> 17 % -6
-1
```

The answers have the same sign as the modulus:

```
>>> [5 -5] % 3
[2 1]

>>> [5 -5] % -3
[-1 -2]
```

For a positive real number _x_, _x % 1_ gives the fractional part of _x_:

```
>>> 3.141 % 1
0.141

>>> 3.141.fractionalPart
0.141
```

Modulo of negative number with negative operand:

```
>>> [-5 -4 -3 -2 -1 0] % -5
[0, -4, -3, -2, -1, 0]

>>> [-5.1 -4.1 -3.1 -2.1 -1.1 -0.1] % -5
[-0.1 -4.1 -3.1 -2.1 -1.1 -0.1]
```

Number of squares modulo _n_,
OEIS [A000224](https://oeis.org/A000224):

```
>>> 1:72.collect { :n |
>>> 	1:n.collect { :k |
>>> 		k.square % n
>>> 	}.nub.size
>>> }
[
	 1  2  2  2  3  4  4  3  4  6
	 6  4  7  8  6  4  9  8 10  6
	 8 12 12  6 11 14 11  8 15 12
	16  7 12 18 12  8 19 20 14  9
	21 16 22 12 12 24 24  8 22 22
	18 14 27 22 18 12 20 30 30 12
	31 32 16 12 21 24 34 18 24 24
	36 12
]
```

Modular multiplication tables:

```
>>> 4:5.collect { :m |
>>> 	{ :i :j |
>>> 		(i * j) % m
>>> 	}.table(1:m, 1:m)
>>> }
[
	1 2 3 0;
	2 0 2 0;
	3 2 1 0;
	0 0 0 0
	:;
	1 2 3 4 0;
	2 4 1 3 0;
	3 1 4 2 0;
	4 3 2 1 0;
	0 0 0 0 0
]
```

At `Symbol`:

```
>> `m` % `n`
(% m n)
```

The remainder on division of five by three offset to start with one:

```
>>> 5.mod(3, 1)
2

>>> 17.mod(5, 1)
2

>>> 23.mod(13, -6)
-3
```

Threads over lists:

```
>>> 1:5.mod(3, 0)
[1 2 0 1 2]

>>> 1:5.mod(3, 1)
[1 2 3 1 2]

>>> -3:3.mod(3, 0)
[0 1 2 0 1 2 0]

>>> -3:3.mod(3, 1)
[3 1 2 3 1 2 3]
```

Extract parts of a list cyclically:

```
>>> ['a' 'b' 'c'] @* 1:10.mod(3, 1)
['a' 'b' 'c' 'a' 'b' 'c' 'a' 'b' 'c' 'a']
```

Plot an integer sequence modulo an integer,
i.e. with a fixed modulus:

~~~spl svg=A
(1:50 % 8).linePlot
~~~

![](sw/spl/Help/Image/mod-A.svg)

Plot an integer modulo an integer, i.e. varying the modulus:

~~~spl svg=B
(100 % 1:50).linePlot
~~~

![](sw/spl/Help/Image/mod-B.svg)

Binomial coefficients modulo two:

~~~spl png=C
let k = [0L .. 64L];
{ :i :j |
	(i >= j).if {
		i.binomial(j) % 2
	} {
		0
	}
}.table(k, k).Bitmap
~~~

![](sw/spl/Help/Image/mod-C.png)

Plot of a spiral matrix where numbers are colored based on their congruence:

~~~spl png=D
(109.spiralMatrix % 109 / 109)
.Greymap
~~~

![](sw/spl/Help/Image/mod-D.png)

Modular addition tables:

~~~spl svg=E
{ :a :b |
	a + b % 4
}.table(0:8, 0:8).matrixPlot
~~~

![](sw/spl/Help/Image/mod-E.svg)

Modulo sum pattern:

~~~spl svg=F
let m = 7;
let n = 2;
{ :i :j |
	((i % m) + (j % m)) = n
}.table(0:25, 0:25).boole.matrixPlot
~~~

![](sw/spl/Help/Image/mod-F.svg)

Simulate a particle bouncing in a noncommensurate box:

~~~spl svg=G
[0, 0.01 .. 15].collect { :t |
	t % [2.sqrt 1]
}.Line
~~~

![](sw/spl/Help/Image/mod-G.svg)

Plot number of squares modulo _n_,
OEIS [A000224](https://oeis.org/A000224):

~~~spl svg=H
1:150.collect { :n |
	1:n.collect { :k |
		k.square % n
	}.nub.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/mod-H.svg)

Plot quadratic residue triangle,
OEIS [A048152](https://oeis.org/A048152):

~~~spl svg=I
1:22.triangularArray { :q :p |
	p.square % q
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/mod-I.svg)

Plot modular multiplication table:

~~~spl svg=J
let m = 14;
{ :i :j |
	(i * j) % m
}.table(1:m, 1:m).matrixPlot
~~~

![](sw/spl/Help/Image/mod-J.svg)

Plot left inverse of binary expansions,
OEIS [A028897](https://oeis.org/A028897):

~~~spl svg=K
let a = { :n |
	(n < 10).if {
		n
	} {
		(n % 10 != 0).if {
			a(n - 1) + 1
		} {
			2 * a(n / 10)
		}
	}
};
0:200.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/mod-K.svg)

First differences of the ones-counting sequence,
OEIS [A088705](https://oeis.org/A088705)

~~~spl svg=L
let a = { :n |
	(n < 1).if {
		0
	} {
		(n % 2 = 0).if {
			a(n / 2) - 1
		} {
			1
		}
	}
};
0:127.collect(a:/1).scatterPlot
~~~

![](sw/spl/Help/Image/mod-L.svg)

Implement the Park-Miller generator,
which is correct when caculated with 64-bit IEEE floating point math:

~~~spl svg=M
let a = 48271;
let m = 2 ^ 31 - 1;
let s = 618379;
let n = 100;
let r = { :x |
	(a * x) % m
}.nestList(s, n);
(r / m).discretePlot
~~~

![](sw/spl/Help/Image/mod-M.svg)

Plot the largest _m_ such that _n_ is congruent to -1, 0 or 1 `mod` _k_ for all _k_ from 1 to _m_,
OEIS [A187824](https://oeis.org/A187824):

~~~spl svg=N
2:99.collect { :n |
	let k = 4;
	{
		let r = n % k;
		r < 2 | { k - r < 2 }
	}.whileTrue {
		k := k + 1
	};
	k - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/mod-N.svg)

Plot the smallest non-negative integer not already in the sequence such that _a(n-1)_ is congruent to _a(n)%n_,
OEIS [A125717](https://oeis.org/A125717):

~~~spl svg=O
let l = [0];
1:200.do { :n |
	let k = l.last.mod(n);
	{ l.includes(k) }.whileTrue {
		k := k + n
	};
	l.add(k)
};
l.scatterPlot
~~~

![](sw/spl/Help/Image/mod-O.svg)

* * *

See also: %, /, //, \\, commonResidue, minimalResidue, positiveResidue, quotient, remainder

Guides: Arithemtic Functions, Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Congruence.html)
[2](https://mathworld.wolfram.com/Modulus.html)
[3](https://mathworld.wolfram.com/CommonResidue.html)
[4](https://reference.wolfram.com/language/ref/Mod.html),
_OEIS_
[1](https://oeis.org/A000224)
[2](https://oeis.org/A048152)
[3](https://oeis.org/A028897)
[4](https://oeis.org/A088705),
_W_
[1](https://en.wikipedia.org/wiki/Modulo)

Categories: Math, Operator

# modularInverse

- _modularInverse(k, n)_

Answer the modular inverse of _k_ modulo _n_,
also known as modular multiplicative inverse,
the number _r_ such that the remainder of the division of _r·k_ by _n_ is equal to one.
If _k_ and _n_ are not coprime, no modular inverse exists.

Compute using integers:

```
>>> 3.modularInverse(5)
2

>>> (3 * 2) % 5
1

>>> 3.modularInverse(7)
5

>>> (3 * 5) % 7
1

>>> 11.modularInverse(8)
3

>>> (11 * 3) % 8
1

>>> 7.modularInverse(31)
9

>>> (7 * 9) % 31
1

>>> 42.modularInverse(2017)
1969

>>> (42 * 1969) % 2017
1

>>> 38.modularInverse(97)
23

>>> (38 * 23) % 97
1

>>> 111.modularInverse(10)
1

>>> (111 * 1) % 10
1
```

At large integers:

```
>>> 147198853397
>>> .modularInverse(73599183960)
43827926933

>>> (147198853397L * 43827926933L)
>>> %
>>> 73599183960L
1L
```

At negative numbers:

```
>>> -5.modularInverse(7)
4

>>> (-5 * 4) % 7
1

>>> -486.modularInverse(217)
121

>>> (-486 * 121) % 217
1
```

At modulus `one`:

```
>>> 40.modularInverse(1)
0

>>> (40 * 0) % 1
0
```

`modularInverse` is a periodic function:

```
>>> [
>>> 	2.modularInverse(5),
>>> 	(2 + 5).modularInverse(5)
>>> ]
[3 3]
```

The answer has the same sign as the modulus:

```
>>> 5.modularInverse(7)
3

>>> (5 * 3) % 7
1

>>> 5.modularInverse(-7)
-4

>>> (5 * -4) % 7
1

>>> 52.modularInverse(-217)
-121

>>> (52 * -121) % 217
1
```

If _k_ and _n_ are coprime, then _k_ is invertible modulo _n_ :

```
>>> 7.isCoprime(12)
true

>>> 7.modularInverse(12)
7
```

Computing `modularInverse` twice yields the original argument:

```
>>> 7.modularInverse(9)
>>> .modularInverse(9)
7
```

For nonzero integers _k_ and _n_, _modularInverse(k, n)_ exists if and only if _k_ and _n_ are coprime:

```
>>> 10.isCoprime(21)
true

>>> 10.modularInverse(21)
19

>>> 21.modularInverse(10)
1
```

However, neither 10 and 22 nor 40 and 2018 are coprime:

```
>>> 10.isCoprime(22)
false

>>> {
>>> 	10.modularInverse(22)
>>> }.hasError
true

>>> 40.isCoprime(2018)
false

>>> {
>>> 	40.modularInverse(2018)
>>> }.hasError
true
```

Two numbers are modular inverses of each other if their product is one:

```
>>> let p = 5.prime;
>>> let g = (1 .. p - 1);
>>> { :i :j |
>>> 	(i * j) % p -> [i, j]
>>> }.table(g, g)
>>> .catenate
>>> .select { :each |
>>> 	each.key = 1
>>> }.values
[
	 1  1;
	 2  6;
	 3  4;
	 4  3;
	 5  9;
	 6  2;
	 7  8;
	 8  7;
	 9  5;
	10 10
]

>>> let n = 5.prime;
>>> 1:10.collect { :k |
>>> 	modularInverse(k, n)
>>> }
[1 6 4 3 9 2 8 7 5 10]
```

`extendedGcd` answers modular inverses:

```
>>> extendedGcd(3, 5)
[1, [2, -1]]

>>> modularInverse(3, 5)
2
```

Compute using `powerMod`:

```
>>> modularInverse(3, 5)
2

>>> powerMod(3, -1, 5)
2
```

Plot the sequence with a fixed modulus:

~~~spl svg=A
1:16.collect { :k |
	k.modularInverse(17)
}.discretePlot
~~~

![](sw/spl/Help/Image/modularInverse-A.svg)

~~~spl png=B
let p = 200.prime;
{ :a :b |
	modularInverse(a.square + b.square, p)
}.table(1:100, 1:100)
.rescale
.Graymap
~~~

![](sw/spl/Help/Image/modularInverse-B.png)

A psuedo-random number generator:

~~~spl svg=C
let prng = { :i :n |
	let m = 2147483647;
	let a = 16807;
	let c = 1891423;
	{ :x :k |
		(x[k - 1] = 0).if {
			a
		} {
			let z = modularInverse(
				x[k - 1],
				m
			);
			mod(a * z + c, m)
		}
	}.recurrenceTable([i], n)
};
prng(789714739, 250)
.rescale
.scatterPlot
~~~

![](sw/spl/Help/Image/modularInverse-C.svg)

* * *

See also: ^, eulerPhi, extendedEuclideanAlgorithm, extendedGcd, isCoprime, mod, powerMod

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ModularInverse.html)
[2](https://reference.wolfram.com/language/ref/ModularInverse.html)
_W_
[1](https://en.wikipedia.org/wiki/Modular_multiplicative_inverse)

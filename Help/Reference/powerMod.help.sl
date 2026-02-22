# powerMod

- _powerMod(a, b, m)_

Answers _(a ^ b) % m_.

```
>>> 2.powerMod(10, 3)
1

>>> 3.powerMod(2, 7)
2

>>> 3.powerMod(5, 7)
5

>>> 5.powerMod(3, 13)
8

>>> 4.powerMod(13, 497)
445

>>> 4030.powerMod(2657, 55049)
21144

>>> 21144.powerMod(79081, 55049)
4030
```

If _b_ is negative answer the multiplicative modular inverse of _a^|b|_ and _m_:

```
>>> 38.powerMod(-1, 97)
23

>>> (23 * 38) % 97
1

>>> 3.powerMod(-2, 7)
4

>>> 9.modularInverse(7)
4

>>> 2.powerMod(-1, 5)
3
```

Threads over first argument:

```
>>> 1:4.powerMod(4, 5)
[1 1 1 1]

>>> 10:14.collect { :b |
>>> 	2.powerMod(b, 5)
>>> }
[4 3 1 2 4]
```

Use `powerMod` to generate all coprime integers modulo 9:

```
>>> 2:10.collect { :each |
>>> 	2.powerMod(each, 9)
>>> }.asIdentitySet.sorted
[1 2 4 5 7 8]
```

Find all base two and five pseudoprimes below one thousand:

```
>>> [2 5].collect { :b |
>>> 	2:1000.select { :n |
>>> 		let z = b.powerMod(n - 1, n);
>>> 		z = 1 & {
>>> 			n.isComposite
>>> 		}
>>> 	}
>>> }
[
	341 561 645;
	4 124 217 561 781
]
```

The results have the same sign as the modulus:

```
>>> [5 -5].powerMod(2, 3)
[1 1]

>>> [5 -5].powerMod(2, -3)
[-2 -2]
```

At large integers:

```
>>> let a = [
>>> 	2 9 8 8 3 4 8 1 6 2
>>> 	0 5 8 5 7 4 1 3 6 9
>>> 	1 5 8 9 1 4 2 1 4 9
>>> 	8 8 1 9 4 6 6 3 2 0
>>> 	1 6 3 3 1 2 9 2 6 9
>>> 	5 2 4 2 3 7 9 1 0 2
>>> 	3 0 7 8 8 7 6 1 3 9
>>> ].fromDigits(10L);
>>> let b = [
>>> 	2 3 5 1 3 9 9 3 0 3
>>> 	3 7 3 4 6 4 4 8 6 4
>>> 	6 6 1 2 2 5 4 4 5 2
>>> 	3 6 9 0 0 9 4 7 4 4
>>> 	9 7 5 2 3 3 4 1 5 5
>>> 	4 4 0 7 2 9 9 2 6 5
>>> 	6 8 8 1 2 4 0 3 1 9
>>> ].fromDigits(10L);
>>> let m = 10L ^ 40;
>>> powerMod(a, b, m)
[
	1 5 2 7 2 2 9 9 9 8
	5 8 5 2 4 8 4 5 0 0
	1 6 8 0 8 9 5 8 3 4
	3 7 4 0 4 5 3 0 5 9
].fromDigits(10L)
```

Period of decimal expansion of the reciprocal of the _n_-th prime,
starting at the fourth prime,
OEIS [A002371](https://oeis.org/A002371):

```
>>> 4:67.prime.collect { :p |
>>> 	let k = 1;
>>> 	{
>>> 		powerMod(10, k, p) != 1
>>> 	}.whileTrue {
>>> 		k := k + 1
>>> 	};
>>> 	k
>>> }
[
	  6  2    6  16  18
	 22  28  15   3   5
	 21  46  13  58  60
	 33  35   8  13  41
	 44  96   4  34  53
	108 112  42 130   8
	 46 148  75  78  81
	166  43 178 180  95
	192  98  99  30 222
	113 228 232   7  30
	 50 256 262 268   5
	 69  28 141 146 153
	155 312  79 110
]
```

Fermat pseudoprimes to base two,
also called Sarrus numbers or Poulet numbers,
OEIS [A001567](https://oeis.org/A001567):

```
>>> [3, 5 .. 5000].select { :n |
>>> 	n.isPrime.not & {
>>> 		2.powerMod(n - 1, n) = 1
>>> 	}
>>> }
[
	 341  561  645 1105 1387
	1729 1905 2047 2465 2701
	2821 3277 4033 4369 4371
	4681
]
```

The smallest prime _p_ such that _p^2_ divides _n^(p-1)-1_,
OEIS [A039951](https://oeis.org/A039951):

```
>>> 1:5.collect { :n |
>>> 	let p = 2;
>>> 	{
>>> 		n.powerMod(p - 1, p ^ 2) != 1
>>> 	}.whileTrue {
>>> 		p := p.nextPrime
>>> 	};
>>> 	p
>>> }
[2 1093 11 1093 2]
```

A regular version of Pitoun’s sequence,
OEIS [A029898](https://oeis.org/A029898),
omitting the leading `one`,
OEIS [A153130](https://oeis.org/A153130):

```
>>> 1:18.collect { :n |
>>> 	2.powerMod(n, 9)
>>> }
[
	2 4 8 7 5 1
	2 4 8 7 5 1
	2 4 8 7 5 1
]
```

Plot the sequence with fixed powers:

~~~spl svg=A
1:50.functionPlot { :x |
	x.powerMod(2, 11)
}
~~~

![](sw/spl/Help/Image/powerMod-A.svg)

Plot the sequence with varying powers:

~~~spl svg=B
1:50.functionPlot { :x |
	2.powerMod(x, 11)
}
~~~

![](sw/spl/Help/Image/powerMod-B.svg)

Plot a list of powers of 3 where the exponent is varied, modulo some prime number:

~~~spl svg=C
let n = 44.prime;
[1 .. n - 1].functionPlot { :x |
	3.powerMod(x, n)
}
~~~

![](sw/spl/Help/Image/powerMod-C.svg)

Plot table,
read by rows,
where _n_-th row contains all quadratic residues,
including zero,
modulo _n_,
OEIS [A096008](https://oeis.org/A096008):

~~~spl svg=D
1:30.collect { :n |
	[0 .. n - 1].collect { :k |
		powerMod(k, 2, n)
	}.nub.sort
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-D.svg)

Plot smallest pseudoprime _>n_ to base _n_,
OEIS [A007535](https://oeis.org/A007535):

~~~spl svg=E
1:175.collect { :n |
	let k = n + 1;
	{
		k.isPrime | {
			n.powerMod(k - 1, k) != 1
		}
	}.whileTrue {
		k := k + 1
	};
	k
}.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-E.svg)

Plot number of distinct residues,
OEIS [A195637](https://oeis.org/A195637):

~~~spl svg=F
1:150.collect { :n |
	let m = n - 1;
	0:m.powerMod(n, n).nub.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-F.svg)

Smallest number _m>1_ such that _m^(p-1)-1_ is divisible by _p^2_,
OEIS [A039678](https://oeis.org/A039678):

~~~spl svg=G
1:150.collect { :n |
	let p = n.prime;
	2:Infinity.detect { :a |
		a.powerMod(p - 1, p ^ 2) = 1
	}
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-G.svg)

Shadow transform of the squares,
OEIS [A000188](https://oeis.org/A000188):

~~~spl svg=H
1:150.collect { :n |
	1:n.count { :x |
		x.powerMod(2, n) = 0
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-H.svg)

Plot number of distinct primes among the squares modulo _n_,
OEIS [A132213](https://oeis.org/A132213):

~~~spl svg=I
1:200.collect { :n |
	1:n.powerMod(2, n)
	.unique
	.count(isPrime:/1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/powerMod-I.svg)

* * *

See also: ^, %

Guides: Integer Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PowerMod.html)
_Mathworks_
[1](https://mathworks.com/help/symbolic/sym.powermod.html),
_OEIS_
[1](https://oeis.org/A096008)
[2](https://oeis.org/A001567)
[3](https://oeis.org/A002371)
[4](https://oeis.org/A007535),
_W_
[1](https://en.wikipedia.org/wiki/Modular_exponentiation)

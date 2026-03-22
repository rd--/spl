# divisorSigma

- _divisorSigma(k, n)_

Answer the divisor function _σₖ(n)_.
Where _k=0_, also called _τ(n)_.

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

Divisor sigma at _k=0_,
_τ(n)_,
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

Record values of _τ(n)_,
OEIS [A002182](http://oeis.org/A002182):

```
>>> 0.divisorSigma(1:240)
>>> .recordValues
[1 2 3 4 6 8 9 10 12 16 18 20]
```

Ordinal transform of _τ(n)_,
OEIS [A067004](http://oeis.org/A067004):

```
>>> 0.divisorSigma(1:20)
>>> .ordinalTransform
[1 1 2 1 3 1 4 2 2 3 5 1 6 4 5 1 7 2 8 3]
```

Divisor function _σ₁(n)_,
OEIS [A000203](https://oeis.org/A000203):

```
>>> 1.divisorSigma(1:23)
[
	 1  3  4  7  6 12  8 15 13 18
	12 28 14 24 24 31 18 39 20 42
	32 36 24
]
```

First differences of _σ₁(n)_,
OEIS [A053222](https://oeis.org/A053222):

```
>>> 1.divisorSigma(1:23).differences
[
	2 1 3 -1 6 -4 7 -2 5 -6
	16 -14 10 0 7 -13 21 -19 22 -10
	4 -12
]
```

Second differences of _σ₁(n)_,
OEIS [A053246](https://oeis.org/A053246):

```
>>> 1.divisorSigma(1:23)
>>> .differences(2)
[
	-1 2 -4 7 -10 11 -9 7 -11 22
	-30 24 -10 7 -20 34 -40 41 -32 14
	-16
]
```

_n_ plus divisor function _σ₁(n)_,
OEIS [A155085](https://oeis.org/A155085):

```
>>> let n = 1:13;
>>> n + 1.divisorSigma(n)
[2 5 7 11 11 18 15 23 22 28 23 40 27]
```

Recognize perfect numbers, numbers _n_ such that the sum of their divisors is equal to _2n_:

```
>>> 1:30.select { :n |
>>> 	1.divisorSigma(n) = (2 * n)
>>> }
[6 28]
```

Deficient numbers,
numbers _n_ such that the sum of their divisors is smaller than _2n_,
OEIS [A005100](https://oeis.org/A005100):

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

Abundant numbers,
numbers _n_ such that the sum of their divisors is greater than _2n_,
OEIS [A005101](https://oeis.org/A005101):

```
>>> 1:60.select { :n |
>>> 	1.divisorSigma(n) > (2 * n)
>>> }
[12 18 20 24 30 36 40 42 48 54 56 60]
```

Highly abundant numbers,
OEIS [A002093](https://oeis.org/A002093):

```
>>> 1:60.select { :k |
>>> 	let n = k - 1;
>>> 	let x = 1.divisorSigma(k);
>>> 	1:n.allSatisfy { :m |
>>> 		let y = 1.divisorSigma(m);
>>> 		x > y
>>> 	}
>>> }
[1 2 3 4 6 8 10 12 16 18 20 24 30 36 42 48 60]
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

Numbers _n_ such that _n+0:2_ have the same number of divisors,
OEIS [A005238](https://oeis.org/A005238):

```
>>> 1:600.select { :n |
>>> 	0.divisorSigma(n + 0:2).allEqual
>>> }
[
	 33  85  93 141 201
	213 217 230 242 243
	301 374 393 445
]
```

_a(n)=σ(a(n-1))_
OEIS [A007497](https://oeis.org/A007497):

```
>>> { :n |
>>> 	1.divisorSigma(n)
>>> }.nestList(2, 11)
[2 3 4 7 8 15 24 60 168 480 1512 4800]
```

Smallest number with exactly _n_ divisors,
OEIS [A005179](https://oeis.org/A005179):

```
>>> 1:12.collect { :n |
>>> 	1:Infinity.detect { :m |
>>> 		0.divisorSigma(m) = n
>>> 	}
>>> }
[1 2 4 6 16 12 64 24 36 48 1024 60]

>>> 1024.divisors
[1 2 4 8 16 32 64 128 256 512 1024]

>>> 60.divisors
[1 2 3 4 5 6 10 12 15 20 30 60]
```

Coefficients in expansion of Eisenstein series _E2_,
OEIS [A006352](https://oeis.org/A006352):

```
>>> -24 * 1:9.collect { :n |
>>> 	1.divisorSigma(n)
>>> }
[-24 -72 -96 -168 -144 -288 -192 -360 -312]
```

Expansion of Eisenstein series _E6(q)_,
OEIS [A013973](https://oeis.org/A013973):

```
>>> -504 * 1:8.collect { :n |
>>> 	5.divisorSigma(n)
>>> }
[
	-504 -16632 -122976 -532728 -1575504
	-4058208 -8471232 -17047800
]
```

_n-τ(n)_,
OEIS [A049820](https://oeis.org/A049820):

```
>>> let n = 1:23;
>>> n - 0.divisorSigma(n)
[
	0 0 1 1 3 2 5 4 6 6
	9 6 11 10 11 11 15 12 17 14
	17 18 21
]
```

Divisor function _σ₀(n)_ up to _n=100_,
OEIS [A000005](https://oeis.org/A000005):

~~~spl svg=A oeis=A000005
1:100.functionPlot { :x |
	0.divisorSigma(x)
}
~~~

![](Help/Image/divisorSigma-A.svg)

Divisor function _σ₁(n)_ up to _n=100_,
OEIS [A000203](https://oeis.org/A000203):

~~~spl svg=B oeis=A000203
1:100.functionPlot { :x |
	1.divisorSigma(x)
}
~~~

![](Help/Image/divisorSigma-B.svg)

Plot the log of the divisor function _σ₂(n)_ up to _n=100_:

~~~spl svg=C
1:100.functionPlot { :x |
	2.divisorSigma(x).log
}
~~~

![](Help/Image/divisorSigma-C.svg)

_σ₀(n)_,
also called _τ(n)_,
OEIS [A000005](https://oeis.org/A000005):

~~~spl svg=D oeis=A000005
let n = 200;
0.divisorSigma(1:n).scatterPlot
~~~

![](Help/Image/divisorSigma-D.svg)

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

Number of divisors of _n_ that are at most _√n_,
OEIS [A038548](http://oeis.org/A038548):

~~~spl svg=E oeis=A038548
1:85.collect { :n |
	(0.divisorSigma(n) + 1) / 2
}.floor.scatterPlot
~~~

![](Help/Image/divisorSigma-E.svg)

Smallest _k_ such that _σ(k)=n_, or zero if there is no such _k_,
OEIS [A051444](https://oeis.org/A051444):

~~~spl svg=F oeis=A051444
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

![](Help/Image/divisorSigma-F.svg)

First differences between numbers _k_ for which _σ(k)>σ(k+1)_,
OEIS [A053238](https://oeis.org/A053238):

~~~spl svg=G oeis=A053238
1:350.select { :n |
	1.divisorSigma(n)
	>
	1.divisorSigma(n + 1)
}.differences.stepPlot
~~~

![](Help/Image/divisorSigma-G.svg)

Number of integers less than _n_ but with the same number of divisors,
OEIS [A047983](https://oeis.org/A047983):

~~~spl svg=H oeis=A047983
1:150.collect { :n |
	let tau = 0.divisorSigma(n);
	let m = n - 1;
	1:m.count { :x |
		0.divisorSigma(x) = tau
	}
}.scatterPlot
~~~

![](Help/Image/divisorSigma-H.svg)

_a(n+1)=a(n)+σ(a(n))_,
OEIS [A064491](https://oeis.org/A064491):

~~~spl svg=I oeis=A064491
{ :x |
	x + 0.divisorSigma(x)
}.nestList(1, 47).scatterPlot
~~~

![](Help/Image/divisorSigma-I.svg)

Step plot of _σ3(n)_,
OEIS [A001158](https://oeis.org/A001158):

~~~spl svg=J oeis=A001158
1:100.collect { :n |
	3.divisorSigma(n)
}.stepPlot
~~~

![](Help/Image/divisorSigma-J.svg)

Product of the proper divisors of _n_,
OEIS [A007956](https://oeis.org/A007956):

~~~spl svg=K oeis=A007956
1:200.collect { :n |
	n ^ (0.divisorSigma(n) / 2 - 1)
}.scatterPlot.log
~~~

![](Help/Image/divisorSigma-K.svg)

Where _σ(m)_ rises by at least _n_,
OEIS [A058197](https://oeis.org/A058197):

~~~spl svg=L oeis=A058197
let sigma = 0.divisorSigma(1:5100);
let d = sigma.differences;
1:30.collect { :n |
	d.detectIndex { :x |
		x >= n
	}
}.stepPlot.log
~~~

![](Help/Image/divisorSigma-L.svg)

Shadow transform of _σ(n)_,
OEIS [A072463](https://oeis.org/A072463):

~~~spl svg=M oeis=A072463
let s = Map { :n |
	1.divisorSigma(n)
};
0:150.collect { :n |
	let m = n - 1;
	0:m.sum { :j |
		(s[j] % n = 0).boole
	}
}.scatterPlot
~~~

![](Help/Image/divisorSigma-M.svg)

Inverse Moebius transform applied twice to natural numbers,
OEIS [A007429](https://oeis.org/A007429):

~~~spl svg=N oeis=A007429
1:65.collect { :n |
	1.divisorSigma(n.divisors).sum
}.discretePlot
~~~

![](Help/Image/divisorSigma-N.svg)

Sum of σ of `divisors` of _n_,
OEIS [A007425](https://oeis.org/A007425):

~~~spl svg=O oeis=A007425
1:100.collect { :n |
	n.divisors.sum { :d |
		0.divisorSigma(d)
	}
}.scatterPlot
~~~

![](Help/Image/divisorSigma-O.svg)

Deficiency of _n_,
OEIS [A033879](https://oeis.org/A033879):

~~~spl svg=P oeis=A033879
1:115.collect { :n |
	(2 * n) - 1.divisorSigma(n)
}.discretePlot
~~~

![](Help/Image/divisorSigma-P.svg)

Number of divisors of _2n-1_,
OEIS [A099774](https://oeis.org/A099774):

~~~spl svg=Q oeis=A099774
1:65.collect { :n |
	0.divisorSigma(2 * n - 1)
}.discretePlot
~~~

![](Help/Image/divisorSigma-Q.svg)

_⌊(σ(n^2)/σ(n))_,
OEIS [A079553](https://oeis.org/A079553):

~~~spl svg=R oeis=A079553
1:65.collect { :n |
	(
		0.divisorSigma(n ^ 2)
		/
		0.divisorSigma(n)
	).floor
}.discretePlot
~~~

![](Help/Image/divisorSigma-R.svg)

A sequence by David James Sycamore,
OEIS [A360179](https://oeis.org/A360179):

~~~spl svg=S oeis=A360179
let m = 250;
let a = List(m, 1);
let c = Map();
let h = Map();
let j = 1;
let k = nil;
let u = 1;
2.toDo(m) { :n |
	c.lookup(j, false).if {
		k := j + 0.divisorSigma(u);
		h[j] := h.lookup(j, 0) + 1;
		h[u] := h.lookup(u, 0) - 1
	} {
		k := 0.divisorSigma(j);
		c[j] := true;
		h[j] := h.lookup(j, 0) + 1
	};
	u := u.min(j);
	a[n] := k;
	j := k;
	{
		h.lookup(u, 0) = 0
	}.whileTrue {
		u := u + 1
	}
};
a.scatterPlot
~~~

![](Help/Image/divisorSigma-S.svg)

A sequence by David James Sycamore,
OEIS [A345147](https://oeis.org/A345147):

~~~spl svg=T oeis=A345147
let a = [1];
let s = [];
let m = 250;
1.toDo(m) { :i |
	let p = a.last;
	let q = a.allButLast;
	let r = nil;
	q.includes(p).not.if {
		a.add(0.divisorSigma(p))
	} {
		a.add(p + s[1]);
		s := s.allButFirst
	};
	r := a.secondLast;
	s.insertAt(
		r,
		s.lengthWhile { :x |
			x < r
		} + 1
	)
};
a.scatterPlot
~~~

![](Help/Image/divisorSigma-T.svg)

A variant of a sequence by David James Sycamore,
OEIS [A361511](https://oeis.org/A361511):

~~~spl svg=U oeis=A361511
let k = 250;
let a = List(k, 1);
let c = Map();
let m = 1;
2.toDo(k) { :n |
	let b = a[n - 1];
	c.lookup(b, false).if {
		a[n] := b + 0.divisorSigma(a[m]);
		m := m + 1
	} {
		a[n] := 0.divisorSigma(b)
	};
	c[b] := true
};
a.scatterPlot
~~~

![](Help/Image/divisorSigma-U.svg)

Abundance of _n_,
OEIS [A033880](https://oeis.org/A033880):

~~~spl svg=V oeis=A033880
let n = 1:70;
(1.divisorSigma(n) - (2 * n)).discretePlot
~~~

![](Help/Image/divisorSigma-V.svg)

Coefficients in expansion of Eisenstein series _E2_,
OEIS [A006352](https://oeis.org/A006352):

~~~spl svg=W oeis=A006352
(
	-24 * 1:65.collect { :n |
		1.divisorSigma(n)
	}
).discretePlot
~~~

![](Help/Image/divisorSigma-W.svg)

List in which _n_ appears _τ(n)_ times,
OEIS [A061017](https://oeis.org/A061017):

~~~spl svg=X oeis=A061017
1:17.collect { :n |
	List(0.divisorSigma(n), n)
}.catenate.stepPlot
~~~

![](Help/Image/divisorSigma-X.svg)

First differences of _σ₁(n)_,
OEIS [A053222](https://oeis.org/A053222):

~~~spl svg=Y oeis=A053222
1.divisorSigma(1:85)
.differences
.discretePlot
~~~

![](Help/Image/divisorSigma-Y.svg)

* * *

See also: aliquotSum, divisible, divisors, divisorSum, divisorSummatoryFunction, eulerPhi, isAbundantNumber, unitaryDivisorSigma

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

Unicode: U+03C3 σ Greek Small Letter Sigma; U+03C4 τ Greek Small Letter Tau

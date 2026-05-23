# goldenRatio

- _goldenRatio(n)_

Answer _n_ × the golden ratio,
also called the golden mean,
_(√5+1)/2_,
usually written as ϕ (Phi) or φ(phi), also as τ (tau).

```
>>> 1.goldenRatio
1.61803

>>> (5.sqrt + 1) / 2
1.61803
```

φ is half of the square root of five plus one:

```
>>> 2.goldenRatio
5.sqrt + 1
```

The golden ratio is the `metallicMean` of `one`:

```
>>> 1.metallicMean
1.61803

>>> [1 5.sqrt].mean
1.goldenRatio
```

φ is the number whose inversion is itself minus `one`:

```
>>> let phi = 1.goldenRatio;
>>> 1 / phi
phi - 1
```

and therefore phi and its inverse have equal fraction parts:

```
>>> let phi = 1.goldenRatio;
>>> (phi, 1 / phi)
(1.61803, 0.61803)
```

φ has minimal polynomial:

```
>>> let phi = 1.goldenRatio;
>>> (phi ^ 2) - phi - 1
0
```

φ squared, or φ plus one,
OEIS [A104457](https://oeis.org/A104457):

```
>>> let phi = 1.goldenRatio;
>>> (phi, phi + 1, phi.square)
(1.61803, 2.61803, 2.61803)
```

The family of constants given by this family of polynomials is called the harmonious numbers:

```
>>> let k = 2.harmoniousNumber;
>>> (k ^ 3) - k - 1
0

>>> let k = 3.harmoniousNumber;
>>> (k ^ 4) - k - 1
0
```

Equivalently:

```
>>> let phi = 1.goldenRatio;
>>> (1 + phi - phi.square, 1 + phi)
(1.8E-15, 2.618034)
```

Compute the Fibonacci numbers:

```
>>> 1:20.collect { :n |
>>> 	(1.goldenRatio ^ n / 5.sqrt)
>>> 	.round
>>> }
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987
	1597 2584 4181 6765
]

>>> 1:20.fibonacci
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987
	1597 2584 4181 6765
]
```

Position of 1s in a Fibonacci substitution system:

```
>>> 1:30.collect { :n |
>>> 	let p = (n + 1).goldenRatio.floor;
>>> 	let q = n.goldenRatio.floor;
>>> 	2 - (p - q)
>>> }
[
	0 1 0 0 1 0 1 0 0 1
	0 0 1 0 1 0 0 1 0 1
	0 0 1 0 0 1 0 1 0 0
]

>>> [
>>> 	0 1 0 0 1 0 1 0 0 1
>>> 	0 0 1 0 1 0 0 1 0 1
>>> 	0 0 1 0 0 1 0 1 0 0
>>> ].scan(+)
[
	0  1  1  1  2  2  3  3  3  4
	4  4  5  5  6  6  6  7  7  8
	8  8  9  9  9 10 10 11 11 11
]
```

Compute the effective "inverse" of the Fibonacci numbers:

```
>>> 1:25.collect { :n |
>>> 	(n * 5.sqrt)
>>> 	.log(1.goldenRatio)
>>> 	.round
>>> }
[
	2 3 4 5 5 5 6 6 6 6
	7 7 7 7 7 7 8 8 8 8
	8 8 8 8 8
]
```

As a continued fraction:

```
>>> 1.goldenRatio.continuedFraction(20)
20 # [1]
```

ϕ, taken as a frequency ratio, is about 833.1¢,
sometimes called acoustic phi,
or the phi neutral sixth:

```
>>> 1.goldenRatio.ratioToCents
833.1
```

Number of positive Wythoff A-numbers not exceeding _n_,
OEIS [A005206](https://oeis.org/A005206):

```
>>> let x = 0:76.collect { :n |
>>> 	(n + 1).goldenRatio.floor - n - 1
>>> };
>>> (x, x.asRunArray.runs)
(
	[
		 0  1  1  2  3  3  4  4  5  6
		 6  7  8  8  9  9 10 11 11 12
		12 13 14 14 15 16 16 17 17 18
		19 19 20 21 21 22 22 23 24 24
		25 25 26 27 27 28 29 29 30 30
		31 32 32 33 33 34 35 35 36 37
		37 38 38 39 40 40 41 42 42 43
		43 44 45 45 46 46 47
	],
	[
		1 2 1 2 2 1 2 1 2 2
		1 2 2 1 2 1 2 2 1 2
		1 2 2 1 2 2 1 2 1 2
		2 1 2 2 1 2 1 2 2 1
		2 1 2 2 1 2 2 1
	]
)
```

The ratio of the triangle formed by adjacent points of a regular unit pentagon is φ:

```
>>> let p = 5.circlePoints([0 0], 1, 0);
>>> let a = euclideanDistance(p[1], p[2]);
>>> let b = euclideanDistance(p[1], p[3]);
>>> b / a
1.goldenRatio
```

Integers with even Zeckendorf expansions,
OEIS [A022342](https://oeis.org/A022342):

```
>>> let t = 1.goldenRatio ^ 2;
>>> 1:62.collect { :n |
>>> 	(n * t).floor - n - 1
>>> }
[
	 0  2  3  5  7  8 10 11 13 15
	16 18 20 21 23 24 26 28 29 31
	32 34 36 37 39 41 42 44 45 47
	49 50 52 54 55 57 58 60 62 63
	65 66 68 70 71 73 75 76 78 79
	81 83 84 86 87 89 91 92 94 96
	97 99
]
```

Representation of the integers as a sum of increasing nonconsecutive powers of the golden ratio:

```
>>> let phi = 1.goldenRatio;
>>> [
>>> 	0;
>>> 	-2  1;
>>> 	-2  2;
>>> 	-2  0  2;
>>> 	-4 -1  3;
>>> 	-4  1  3;
>>> 	-4  4;
>>> 	-4  0  4;
>>> 	-4 -2 1 4;
>>> 	-4 -2 2 4
>>> ].collect { :p |
>>> 	[
>>> 		(phi ^ p).sum,
>>> 		(p + 1).fibonacci.sum
>>> 	]
>>> }.catenate
[1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10]
```

_⌊(nφ)_,
OEIS [A066096](https://oeis.org/A066096):

```
>>> let phi = 1.goldenRatio;
>>> (phi * 0:15).floor
[0 1 3 4 6 8 9 11 12 14 16 17 19 21 22 24]
```

_⌊(phi^2×n)_,
OEIS [A090909](https://oeis.org/A090909):

```
>>> let phi = 1.goldenRatio;
>>> (phi ^ 2 * 1:15).floor
[2 5 7 10 13 15 18 20 23 26 28 31 34 36 39]
```

In terms of `sqrt`, `cos` and `arcSin`:

```
>>> (3/5 * 3/4.sqrt.arcSin).cos
1/2.goldenRatio
```

_⌈(nφ²)_,
OEIS [A004957](https://oeis.org/A004957):

```
>>> let phi = 1.goldenRatio;
>>> let n = 0:14;
>>> (n * phi.square).ceiling
[0 3 6 8 11 14 16 19 21 24 27 29 32 35 37]
```

_⌈(n/φ)_,
OEIS [A019446](https://oeis.org/A019446):

```
>>> (1:17 / 1.goldenRatio).ceiling
[1 2 2 3 4 4 5 5 6 7 7 8 9 9 10 10 11]
```

_⌊(nφ)+1_,
OEIS [A026351](https://oeis.org/A026351):

```
>>> (0:13 * 1.goldenRatio).floor + 1
[1 2 4 5 7 9 10 12 13 15 17 18 20 22]
```

Column one of the rank array of φ,
OEIS [A283733](https://oeis.org/A283733):

```
>>> let a = Map { :n |
>>> 	(n = 0).if {
>>> 		1
>>> 	} {
>>> 		[
>>> 			a[n - 1],
>>> 			1,
>>> 			n.goldenRatio.floor
>>> 		].sum
>>> 	}
>>> };
>>> a[0:13]
[1 3 7 12 19 28 38 50 63 78 95 113 133 155]
```

Joint-rank array of the numbers _j*φ^(i-1)_,
read by antidiagonals,
OEIS [A182801](https://oeis.org/A182801):

```
>>> let r = 1.goldenRatio;
>>> 1:10.antidiagonalArray { :i :j |
>>> 	let m = i + log(j, r);
>>> 	1:m.sum { :k |
>>> 		(j * (r ^ (i - k))).floor
>>> 	}
>>> }
[
	1;
	3 2;
	5 6 4;
	7 9 11 8;
	10 13 16 19 14;
	12 18 23 28 32 25;
	15 21 31 39 48 54 42;
	17 26 36 52 66 81 89 71;
	20 29 44 61 86 110 134 147 117;
	22 34 49 73 102 141 181 221 240 193
]
```

Interspersion of the signature sequence of φ,
OEIS [A167267](https://oeis.org/A167267):

```
>>> let phi = 1.goldenRatio;
>>> let k = 10;
>>> let f = { :v |
>>> 	0:k.collect { :q |
>>> 		1:q.sum { :i |
>>> 			(i * v).ceiling
>>> 		}
>>> 	}
>>> };
>>> let x = f(phi);
>>> let y = f(1 / phi);
>>> (0 .. (k - 1) / phi).collect { :q |
>>> 	(0 .. k - 1).collect { :p |
>>> 		[
>>> 			x[p + 1],
>>> 			p * q,
>>> 			1,
>>> 			y[q + 1]
>>> 		].sum
>>> 	}
>>> }
[
	 1  3  7 12 19 28 38 50  63  78;
	 2  5 10 16 24 34 45 58  72  88;
	 4  8 14 21 30 41 53 67  82  99;
	 6 11 18 26 36 48 61 76  92 110;
	 9 15 23 32 43 56 70 86 103 122;
	13 20 29 39 51 65 80 97 115 135
]
```

Plot the fractional part of multiples of the golden ratio:

~~~spl svg=A
1:100.functionPlot { :n |
	n.goldenRatio.fractionalPart
}
~~~

![](Help/Image/goldenRatio-A.svg)

Position of ones in a Fibonacci substitution system:

~~~spl svg=B
1:30.collect { :n |
	let f = { :x | x.goldenRatio.floor };
	2 - (f(n + 1) - f(n))
}.prefixSum.scatterPlot
~~~

![](Help/Image/goldenRatio-B.svg)

Draw the golden rectangle,
partitioned into a unit square and another golden rectangle:

~~~spl svg=C
let phi = 1.goldenRatio;
let y = phi - 1;
[
	Rectangle[0 0; 1 phi],
	Line[0 y; 1 y]
].LineDrawing
~~~

![](Help/Image/goldenRatio-C.svg)

A low discrepancy quasirandom sequence:

~~~spl svg=D
let phi = 1.goldenRatio;
let a = 1 / phi;
1:100.collect { :n |
	(0.5 + (a * n)) % 1
}.scatterPlot
~~~

![](Help/Image/goldenRatio-D.svg)

A rectangle in proportion √φ partitioned into three similar rectangles:

~~~spl svg=E
let phi = 1.goldenRatio;
let a = phi ^ 5/2;
let b = phi ^ 2;
let c = phi ^ 1/2;
[
	Rectangle[0 0; a b],
	Line[c 0; c b],
	Line[0 1; c 1]
].LineDrawing
~~~

![](Help/Image/goldenRatio-E.svg)

The golden triangle:

~~~spl svg=F
let phi = 1.goldenRatio;
sssTriangle(phi, phi, 1)
~~~

![](Help/Image/goldenRatio-F.svg)

The tips of a pentagram are golden triangles:

~~~spl svg=G
[0 0].pentagram(1, 1/10.pi)
~~~

![](Help/Image/goldenRatio-G.svg)

The binary case answers a `Decimal` value with _m_ decimal places:

```
>>> 1.goldenRatio(34)
1.6180339887498948482045868343656381D
```

φ is also stored as a named constant with higher precision,
and this stored value gives the upper limit for _m_,
OEIS [A001622](https://oeis.org/A001622):

```
>>> let n = 'GoldenRatio';
>>> let k = n.namedConstant;
>>> (k, k.scale)
(1.618034, 104)
```

Scatter plot of the digits of φ:

~~~spl svg=H
1.goldenRatio(104)
.integerDigits
.scatterPlot
~~~

![](Help/Image/goldenRatio-H.svg)

Signature sequence of 1/φ,
OEIS [A084531](https://oeis.org/A084531):

~~~spl svg=I oeis=A084531
let phi = 1.goldenRatio;
phi.signatureSequence(200)
.scatterPlot
~~~

![](Help/Image/goldenRatio-I.svg)

An array of numbers for a ternary numeration system read by antidiagonals,
OEIS [A038150](https://oeis.org/A038150):

~~~spl svg=J oeis=A038150
let phi = 1.goldenRatio;
let t = { :n :j |
	(j = 1).if {
		((n - 1) * phi).floor + 1
	} {
		(phi.square * t(n, j - 1)).floor + 1
	}
};
1:11.triangularArray { :n :m |
	t(n - m + 1, m)
}.catenate.scatterPlot.log
~~~

![](Help/Image/goldenRatio-J.svg)

Powers of phi in the representation of the integer _n_ as a sum of increasing nonconsecutive powers of the golden ratio,
OEIS [A104605](https://oeis.org/A104605):

~~~spl svg=K oeis=A104605
OeisEntry('A104605').then { :e |
	e.bFileSequence
	.first(113)
	.discretePlot
}
~~~

![](Help/Image/goldenRatio-K.svg)

An _eta-sequence_,
the differences of the rounded multiples of φ,
OEIS [A006340](https://oeis.org/A006340):

~~~spl svg=L oeis=A006340
let x = 0:93.collect(goldenRatio:/1);
(x.round.differences - 1).discretePlot
~~~

![](Help/Image/goldenRatio-L.svg)

Array _⌊nφ-⌊kφ-⌊(nφ-kφ)_,
read by antidiagonals,
OEIS [A188294](https://oeis.org/A188294):

~~~spl svg=M oeis=A188294
let r = 1.goldenRatio;
1:12.antidiagonalArray { :k :n |
	(n * r).floor - (k * r).floor - ((n * r) - (k * r)).floor
}.catenate.discretePlot
~~~

![](Help/Image/goldenRatio-M.svg)

Inverse of the Lucas sequence,
nearly,
OEIS [A130241](https://oeis.org/A130241),
also,
from second term on,
OEIS [A130247](https://oeis.org/A130247):

~~~spl svg=N oeis=A130241
let n = 2:65;
(n + 0.5).log(1.goldenRatio).floor.discretePlot
~~~

![](Help/Image/goldenRatio-N.svg)

The left budding sequence,
OEIS [A019587](https://oeis.org/A019587):

~~~spl svg=O oeis=A019587
let r = 1.goldenRatio;
let p:/1 = fractionalPart:/1;
1:100.collect { :n |
	1:n.sum { :k |
		(p(k * r) <= p(n * r)).boole
	}
}.scatterPlot
~~~

![](Help/Image/goldenRatio-O.svg)

The right budding sequence,
OEIS [A019588](https://oeis.org/A019588):

~~~spl svg=P oeis=A019588
let r = -1.goldenRatio;
let p:/1 = fractionalPart:/1;
1:100.collect { :n |
	1:n.sum { :k |
		(p(k * r) <= p(n * r)).boole
	}
}.scatterPlot
~~~

![](Help/Image/goldenRatio-P.svg)

Number of _k<n_ such that _p(k*r)>p(n*r)_ where _p(x)_ is the fractional part of _x_,
OEIS [A194733](https://oeis.org/A194733):

~~~spl svg=Q oeis=A194733
let r = 1.goldenRatio;
let p:/1 = fractionalPart:/1;
1:100.collect { :n |
	1:n.sum { :k |
		(p(k * r) > p(n * r)).boole
	}
}.scatterPlot
~~~

![](Help/Image/goldenRatio-Q.svg)

Note that the constant is correctly rounded,
unlike the calculation in terms of `sqrt`,
and that this distinction is important for some calculations:

```
>> 1.goldenRatio.asString
1.618033988749894

>> ((5.sqrt + 1) / 2).asString
1.618033988749895
```

* * *

See also: e, fibonacci, fibonacciSequence, goldenAngle, harmoniousNumber, metallicMean, logarithmicSpiral, pi, plasticRatio, supergoldenRatio, wythoffLower

Guides: Mathematical Constants, Xenharmonic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GoldenRatio.html)
[2](https://mathworld.wolfram.com/GoldenRectangle.html)
[3](https://mathworld.wolfram.com/GoldenTriangle.html)
[4](https://reference.wolfram.com/language/ref/GoldenRatio.html),
_OEIS_
[1](https://oeis.org/A001622)
[2](https://oeis.org/A005206)
[3](https://oeis.org/A104457)
[4](https://oeis.org/A084531),
_W_
[1](https://en.wikipedia.org/wiki/Golden_ratio)
[2](https://en.wikipedia.org/wiki/Golden_rectangle)
[3](https://en.wikipedia.org/wiki/Golden_triangle_(mathematics)),
_Xenharmonic_
[1](https://en.xen.wiki/w/Acoustic_phi)

Unicode: U+03C6 φ Greek Small Letter Phi; U+03C4 τ Greek Small Letter Tau

Categories: Math, Constant

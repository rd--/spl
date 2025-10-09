# goldenRatio

- _goldenRatio(n)_

Answer _n_ × the golden ratio,
_(√5 + 1) / 2_,
usually written as Phi or phi, also as tau.

```
>>> 1.goldenRatio
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
>>> (1 + phi = phi.square, 1 + phi)
(true, 2.618034)
```

Compute the Fibonacci numbers:

```
>>> 1:20.collect { :n |
>>> 	(1.goldenRatio ^ n / 5.sqrt)
>>>	.round
>>> }
[
	1 1 2 3 5 8 13 21 34 55
	89 144 233 377 610 987
	1597 2584 4181 6765
]

>>> 20.fibonacciSequence
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
(1 # 20)
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
		2 1 2 2 1 2 1
	]
)
```

Plot the fractional part of multiples of the golden ratio:

~~~spl svg=A
1:100.functionPlot { :n |
	n.goldenRatio.fractionalPart
}
~~~

![](sw/spl/Help/Image/goldenRatio-A.svg)

Position of ones in a Fibonacci substitution system:

~~~spl svg=B
1:30.collect { :n |
	let f = { :x | x.goldenRatio.floor };
	2 - (f(n + 1) - f(n))
}.prefixSum.scatterPlot
~~~

![](sw/spl/Help/Image/goldenRatio-B.svg)

Draw the golden rectangle,
partitioned into a unit square and another golden rectangle:

~~~spl svg=C
let phi = 1.goldenRatio;
let y = phi - 1;
[
	Rectangle([0 0], [1 phi]),
	Line([0 y; 1 y])
].LineDrawing
~~~

![](sw/spl/Help/Image/goldenRatio-C.svg)

A low discrepancy quasirandom sequence:

~~~spl svg=D
let phi = 1.goldenRatio;
let a = 1 / phi;
1:100.collect { :n |
	(0.5 + (a * n)) % 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/goldenRatio-D.svg)

A rectangle in proportion √φ partitioned into three similar rectangles:

~~~spl svg=E
let phi = 1.goldenRatio;
let a = phi ^ 5/2;
let b = phi ^ 2;
let c = phi ^ 1/2;
[
	Rectangle([0 0], [a b]),
	Line([c 0; c b]),
	Line([0 1; c 1])
].LineDrawing
~~~

![](sw/spl/Help/Image/goldenRatio-E.svg)

The golden triangle:

~~~spl svg=F
let phi = 1.goldenRatio;
sssTriangle(phi, phi, 1)
~~~

![](sw/spl/Help/Image/goldenRatio-F.svg)

The tips of a pentagram are golden triangles:

~~~spl svg=G
[0 0].pentagram(1, 1/10.pi)
~~~

![](sw/spl/Help/Image/goldenRatio-G.svg)

* * *

See also: e, fibonacci, fibonacciSequence, goldenAngle, harmoniousNumber, metallicMean, pi, plasticRatio, supergoldenRatio, wythoffLower

Guides: Mathematical Constants, Xenharmonic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GoldenRatio.html)
[2](https://mathworld.wolfram.com/GoldenRectangle.html)
[3](https://mathworld.wolfram.com/GoldenTriangle.html)
[4](https://reference.wolfram.com/language/ref/GoldenRatio.html),
_OEIS_
[1](https://oeis.org/A001622)
[2](https://oeis.org/A005206),
_W_
[1](https://en.wikipedia.org/wiki/Golden_ratio)
[2](https://en.wikipedia.org/wiki/Golden_rectangle)
[3](https://en.wikipedia.org/wiki/Golden_triangle_(mathematics)),
_Xenharmonic_
[1](https://en.xen.wiki/w/Acoustic_phi)

Unicode: U+03C6 φ Greek Small Letter Phi

Categories: Math, Constant

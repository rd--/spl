# convolve

- _convolve(u, v)_

Convolution, also known as Fourier convolution and polynomial multiplication.
The answer size is the sum of the input sizes minus one.
Implemented using direct calculation.

```
>>> [2 3 4].convolve([1 2 3])
[2 7 16 17 12]

>>> [1 0 1].convolve([2 7])
[2 7 2 7]

>>> let u = [1 1 1];
>>> let v = [1 1 0 0 0 1 1];
>>> u.convolve(v)
[1 2 2 1 0 1 2 2 1]
```

Convolve with a single element:

```
>>> [1].convolve([1 2 3 4 5 6])
[1 2 3 4 5 6]
```

Self-convolution of Fibonacci numbers,
OEIS [A001629](https://oeis.org/A001629):

```
>>> let f = 0:36.fibonacci;
>>> convolve(f, f).first(38)
[
	0 0 1 2 5 10 20 38 71 130 235
	420 744 1308 2285 3970 6865
	11822 20284 34690 59155 100610
	170711 289032 488400 823800
	1387225 2332418 3916061 6566290
	10996580 18394910 30737759
	51310978 85573315 142587180
	237387960 394905492
]
```

Self-convolution of Pell numbers,
OEIS [A006645](https://oeis.org/A006645):

```
>>> let p = 14.pellSequence;
>>> p.convolve(p).first(14)
[
	0 0 1 4 14 44 131 376 1052 2888
	7813 20892 55338 145428
]
```

Self-convolution of Lucas numbers,
OEIS [A004799](https://oeis.org/A004799):

```
>>> let p = 15.lucasSequence.allButFirst;
>>> p.convolve(p).first(14)
[
	1 6 17 38 80 158 303 566 1039 1880
	3364 5964 10493 18342
]
```

Multiply numbers by convolving digit lists:

```
>>> let u = 24561.integerDigits;
>>> let v = 1247.integerDigits;
>>> let w = convolve(u, v);
>>> (w, w.fromDigits, 24561 * 1247)
(
	[2 8 21 46 61 61 46 7],
	30627567,
	30627567
)
```

At `Symbol`:

```
>> [`x` `y`].convolve([`a` `b` `c`])
>> .allButFirstAndLast
[(+ (* b x) (* a y)), (+ (* c x) (* b y))]

>>> [`x` `y`].convolve([`a` `b` `c`])
>>> .collect(printString/1)
[
	'(* a x)',
	'(+ (* b x) (* a y))',
	'(+ (* c x) (* b y))',
	'(* c y)'
]
```

A sequence that shifts two places left when convolved with itself,
OEIS [A007477](https://oeis.org/A007477):

```
>>> let x = [
>>> 	1 1 1 2 3
>>> 	6 11 22 44 90
>>> 	187 392 832 1778 3831
>>> 	8304 18104 39666
>>> ];
>>> let n = x.size;
>>> x.convolve(x).first(n)
[
	1 2 3 6 11
	22 44 90 187 392
	832 1778 3831 8304 18104
	39666 87296 192896
]
```

Convolve natural numbers with characteristic function of triangular numbers,
OEIS [A006463](https://oeis.org/A006463):

```
>>> let n = 30;
>>> convolve(
>>> 	1:n,
>>> 	1:n.collect(
>>> 		isTriangularNumber/1
>>> 	).boole
>>> ).first(n)
[
	1 2 4 6 8 11 14 17 20 24
	28 32 36 40 45 50 55 60 65 70
	76 82 88 94 100 106 112 119 126 133
]
```

Convolve natural numbers with characteristic function of triangular numbers,
OEIS [A060432](https://oeis.org/A060432):

```
>>> let n = 29;
>>> convolve(
>>> 	0:n,
>>> 	0:n.collect(
>>> 		isTriangularNumber/1
>>> 	).boole
>>> ).first(n)
[
	0 1 3 5 8 11 14 18 22 26
	30 35 40 45 50 55 61 67 73 79
	85 91 98 105 112 119 126 133 140
]
```

A convolution typically smooths the function.
Smooth box function (to a triangle function):

~~~spl svg=A
let x = (-1 -- 1).discretize(100);
let u = x.collect(unitBox/1);
u.convolve(u).linePlot
~~~

![](Help/Image/convolve-A.svg)

Smooth triangle function:

~~~spl svg=B
let x = (-1 -- 1).discretize(100);
let u = x.collect(unitBox/1);
let v = u.convolve(u);
v.convolve(v).linePlot
~~~

![](Help/Image/convolve-B.svg)

Autocorrelation of white noise is an impulse:

~~~spl svg=C
let r = Sfc32(317841);
let u = r.randomReal([-1 1], [200]);
let v = u.reverse;
u.convolve(v).linePlot
~~~

![](Help/Image/convolve-C.svg)

Find the autocorrelation of a list:

~~~spl svg=D
let u = 1:100.collect { :i | (i ^ 2) % 17 };
let v = u.reverse;
(u ++ u).convolve(v).middle(100).linePlot
~~~

![](Help/Image/convolve-D.svg)

Self convolution of
OEIS [A073739](https://oeis.org/A073739),
OEIS [A073740](https://oeis.org/A073740):

~~~spl svg=E oeis=A073740
let k = 150;
let a = Map { :n |
	(n <= 2).if {
		1
	} {
		n.isEven.if {
			0
		} {
			let m = n + 1;
			(m / 2).prime - a[n - 2]
		}
	}
};
let b = a[0 .. k];
b.convolve(b).first(k + 1).scatterPlot.log
~~~

![](Help/Image/convolve-E.svg)

Self-convolution of the inverse of the sixth cyclotomic polynomial,
OEIS [A010892](https://oeis.org/A010892),
OEIS [A099254](https://oeis.org/A099254):

~~~spl svg=F oeis=A099254
let a = [1 1 0 -1 -1 0].repeat(13);
let k = a.size;
a.convolve(a).first(k).discretePlot
~~~

![](Help/Image/convolve-F.svg)

From Bertrand’s postulate,
_2*P(n)-P(n+1)_,
OEIS [A062234](https://oeis.org/A062234):

~~~spl svg=G oeis=A062234
[-1 2].convolve(1:61.prime)
.allButFirstAndLast
.discretePlot
~~~

![](Help/Image/convolve-G.svg)

* * *

See also: accumulate, differences, fft, fftConvolve, ifft, inner, linearRecurrence, movingAverage, partition

Guides: Fourier Analysis Functions, Signal Processing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListConvolve.html)
[2](https://reference.wolfram.com/language/ref/Convolve.html),
_OEIS_
[1](https://oeis.org/A001629),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/conv.html),
_W_
[1](https://en.wikipedia.org/wiki/Convolution)

Unicode: U+229B ⊛ Circled Asterisk Operator

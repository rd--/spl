# harmonicNumber

- _harmonicNumber(n, r=1)_

The _n_-th harmonic number is the `sum` of the `reciprocal` of the range _1:n_.

```
>>> 11.harmonicNumber
1:11.reciprocal.sum
```

At `SmallFloat`:

```
>>> 43.harmonicNumber
4.35

>>> 4550.harmonicNumber
9.00

>>> 12367.harmonicNumber
10.00
```

At `LargeInteger`:

```
>>> 43L.harmonicNumber
532145396070491417/122332313750680800
```

Analytic form, in terms of γ and ψ:

```
>>> let n = 4550;
>>> n.harmonicNumber
1.eulerGamma + (n + 1).digamma
```

The value _H(n)−ln(n)_ decrease monotonically towards the limit γ:

```
>>> let n = 89014;
>>> let h = n.harmonicNumber;
>>> h - n.log
1.eulerGamma
```

First ten harmonic numbers,
threads over lists:

```
>>> 1L:10.harmonicNumber
[
	1/1 3/2 11/6 25/12 137/60 49/20
	363/140 761/280 7129/2520 7381/2520
]
```

Numerator of harmonic number,
OEIS [A001008](https://oeis.org/A001008):

```
>>> 1L:11.harmonicNumber.numerator
[1 3 11 25 137 49 363 761 7129 7381 83711]
```

Denominator of harmonic number,
OEIS [A002805](https://oeis.org/A002805):

```
>>> 1L:11.harmonicNumber.denominator
[1 2 6 12 60 20 140 280 2520 2520 27720]
```

Wolstenholme numbers,
OEIS [A007406](https://oeis.org/A007406):

```
>>> 1L:8.harmonicNumber(2)
>>> .numerator
[1 5 49 205 5269 5369 266681 1077749]
```

Wolstenholme numbers,
OEIS [A007408](https://oeis.org/A007408):

```
>>> 1L:7.harmonicNumber(3)
>>> .numerator
[1 9 251 2035 256103 28567 9822481]
```

Denominators of _r=2_ harmonic numbers,
OEIS [A007407](https://oeis.org/A007407):

```
>>> 1L:8.harmonicNumber(2)
>>> .denominator
[1 4 36 144 3600 3600 176400 705600]
```

Plot over a subset of the integers:

~~~spl svg=A
1:100.functionPlot(harmonicNumber:/1)
~~~

![](Help/Image/harmonicNumber-A.svg)

The average number of comparisons in Quicksort:

~~~spl svg=B
1:65.collect { :n |
	let m = n + 1;
	2 * m * (m.harmonicNumber - 1)
}.discretePlot
~~~

![](Help/Image/harmonicNumber-B.svg)

Book stacking with the maximal overhang:

~~~spl svg=C
1:10.collect { :k |
	let x = k.harmonicNumber;
	Rectangle(
		0 - [x, (k + 1) / 10],
		0 - [x - 1, k / 10]
	)
}.LineDrawing
~~~

![](Help/Image/harmonicNumber-C.svg)

* * *

See also: digamma, gamma, harmonicMean, harmonicProgression, harmonicSeries

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HarmonicNumber.html)
[2](https://reference.wolfram.com/language/ref/HarmonicNumber.html),
_OEIS_
[1](https://oeis.org/A002805)
[2](https://oeis.org/A001008),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.harmonic),
_W_
[1](https://en.wikipedia.org/wiki/Harmonic_number)

Categories: Math, Sequence

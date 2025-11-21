# harmonicNumber

- _harmonicNumber(n)_

The _n_-th harmonic number is the `sum` of the `reciprocal` of the range _1:n_.

```
>>> 11.harmonicNumber
1:11.reciprocal.sum

>>> 4550.harmonicNumber
9.0002080629311

>>> 12367.harmonicNumber
10.000043008276
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

Threads over lists:

```
>>> 1:9.harmonicNumber
[
	1 3/2 11/6 25/12 137/60 49/20
	363/140 761/280 7129/2520
]
```

Plot over a subset of the integers:

~~~spl svg=A
1:100.functionPlot(harmonicNumber:/1)
~~~

![](sw/spl/Help/Image/harmonicNumber-A.svg)

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

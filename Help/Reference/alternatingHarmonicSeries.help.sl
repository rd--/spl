# alternatingHarmonicSeries

- _alternatingHarmonicSeries(n)_

Answer the first _n_ terms of the alternating harmonic series,
which is conditionally convergent to the natural logarithm of two.

The alternating harmonic series:

```
>>> 9.alternatingHarmonicSeries
[1 -1/2 1/3 -1/4 1/5 -1/6 1/7 -1/8 1/9]

>>> 47
>>> .alternatingHarmonicSeries
>>> .prefixSum
>>> .mean
0.69737

>>> 2.log
0.693147
```

Numerator of the _n_-th alternating harmonic number
OEIS [A058313](https://oeis.org/A058313):

```
>>> 11.alternatingHarmonicSeries
>>> .prefixSum.numerator
[1 1 5 7 47 37 319 533 1879 1627 20417]
```

Denominator of the _n_-th alternating harmonic number
OEIS [A058312](https://oeis.org/A058312):

```
>>> 11.alternatingHarmonicSeries
>>> .prefixSum.denominator
[1 2 6 12 60 60 420 840 2520 2520 27720]
```

Plot the partial sums of the first few terms of the alternating harmonic series:

~~~spl svg=A
47.alternatingHarmonicSeries
.prefixSum
.linePlot
~~~

![](Help/Image/alternatingHarmonicSeries-A.svg)

The alternating harmonic series:

~~~spl svg=B
65.alternatingHarmonicSeries
.discretePlot.logScale
~~~

![](Help/Image/alternatingHarmonicSeries-B.svg)

Numerator of the _n_-th alternating harmonic number
OEIS [A058313](https://oeis.org/A058313):

~~~spl svg=C oeis=A058313
65.alternatingHarmonicSeries
.prefixSum.numerator.discretePlot.log
~~~

![](Help/Image/alternatingHarmonicSeries-C.svg)

Denominator of the _n_-th alternating harmonic number
OEIS [A058312](https://oeis.org/A058312):

~~~spl svg=D oeis=A058312
65.alternatingHarmonicSeries
.prefixSum.denominator.discretePlot.log
~~~

![](Help/Image/alternatingHarmonicSeries-D.svg)

* * *

See also: harmonicNumber, harmonicProgression, harmonicSeries

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AlternatingHarmonicSeries.html)
[2](https://mathworld.wolfram.com/AlternatingSeries.html),
_W_
[1](https://en.wikipedia.org/wiki/Harmonic_series_(mathematics))
[2](https://en.wikipedia.org/wiki/Alternating_series)

# alternatingHarmonicSeries

- _alternatingHarmonicSeries(n)_

Answer the first _n_ terms of the alternating harmonic series,
which is conditionally convergent to the natural logarithm of two.

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

Plot the sum of the first few terms:

~~~spl svg=A
47
.alternatingHarmonicSeries
.prefixSum
.linePlot
~~~

![](sw/spl/Help/Image/alternatingHarmonicSeries-A.svg)

* * *

See also: harmonicNumber, harmonicProgression, harmonicSeries

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AlternatingHarmonicSeries.html),
_W_
[1](https://en.wikipedia.org/wiki/Harmonic_series_(mathematics))

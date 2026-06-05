# harmonicSeries

- _harmonicSeries(n)_

Answer the first _n_ terms of the harmonic series.

```
>>> 17.harmonicSeries
1 / [1 .. 17]
```

The first _n_ terms sum to approximately _log(n)+γ_:

```
>>> 200.harmonicSeries.sum
5.8780

>>> 200.log + 1.eulerGamma
5.8755
```

Partials sums:

```
>>> 7.harmonicSeries.prefixSum
[1/1 3/2 11/6 25/12 137/60 49/20 363/140]

>>> 23.harmonicSeries.prefixSum
1:23.harmonicNumber
```

The harmonic series:

~~~spl svg=A
17.harmonicSeries.discretePlot
~~~

![](Help/Image/harmonicSeries-A.svg)

* * *

See also: alternatingHarmonicSeries, harmonicNumber, harmonicProgression

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HarmonicSeries.html),
_W_
[1](https://en.wikipedia.org/wiki/Harmonic_series_(mathematics))

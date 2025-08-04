# harmonicProgression

- _harmonicProgression(n, a=1, d=1)_

Answer a `List` holding the first _n_ places of the harmonic progression,
with initial denominator _a_ incrementing by _d_,
the reciprocal of the arithmetic progression.

```
>>> 5.harmonicProgression(1, 2)
[1/1 1/3 1/5 1/7 1/9]

>>> 5.harmonicProgression(2, 3)
1 / [2 5 8 11 14]
```

`harmonicNumber` is the sum of the unit harmonic progression:

```
>>> 17.harmonicProgression(1, 1).sum
42142223/12252240

>>> 17.harmonicNumber
42142223/12252240

>>> Fraction(1, 1:17).sum
42142223/12252240
```

Plot the first few terms of a harmonic progression:

~~~spl svg=A
17.harmonicProgression(1, 1)
.discretePlot
~~~

![](sw/spl/Help/Image/harmonicProgression-A.svg)

* * *

See also: arithmeticProgression, geometricProgression, harmonicNumber

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HarmonicSeries.html),
_W_
[1](https://en.wikipedia.org/wiki/Harmonic_progression_(mathematics))

Categories: Arithmetic

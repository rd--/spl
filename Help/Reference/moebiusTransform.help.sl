# moebiusTransform

- _moebiusTransform([x₁ x₂ …])_

Answer the Moebius transform of the integer sequence _x_.

Of the `divisorSigma` function answers the natural numbers,
OEIS [A000203](https://oeis.org/A000203):

```
>>> [1 3 4 7 6 12 8 15 13 18 12 28 14 24]
>>> .moebiusTransform
[1 .. 14]

>>> 1.divisorSigma(1:14)
[1 3 4 7 6 12 8 15 13 18 12 28 14 24]
```

Of `one` and then `zero` answers the `moebiusMu` function,
OEIS [A008683](https://oeis.org/A008683):

```
>>> [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
>>> .moebiusTransform
[1 -1 -1 0 -1 1 -1 0 0 1 -1 0 -1 1 1 0 -1]

>>> 1:17.collect(moebiusMu:/1)
[1 -1 -1 0 -1 1 -1 0 0 1 -1 0 -1 1 1 0 -1]
```

Applied twice,
OEIS [A007427](https://oeis.org/A007427):

```
>>> [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
>>> .moebiusTransform
>>> .moebiusTransform
[1 -2 -2 1 -2 4 -2 0 1 4 -2 -2 -2 4 4 0 -2]
```

Applied thrice,
OEIS [A007427](https://oeis.org/A007427):

```
>>> [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
>>> .moebiusTransform
>>> .moebiusTransform
>>> .moebiusTransform
[1 -3 -3 3 -3 9 -3 -1 3 9 -3 -9 -3 9 9 0 -3]
```

Moebius transform of OEIS [A003961](https://oeis.org/A003961),
OEIS [A003972](https://oeis.org/A003972):

```
>>> [1 3 5 9 7 15 11 27 25 21 13 45 17 33]
>>> .moebiusTransform
[1 2 4 6 6 8 10 18 20 12 12 24 16 20]
```

Plot
OEIS [A007428](https://oeis.org/A007428):

~~~spl svg=A
[1].padRight([64], 0)
.moebiusTransform
.moebiusTransform
.moebiusTransform
.discretePlot
~~~

![](sw/spl/Help/Image/moebiusTransform-A.svg)

Moebius transform of primes,
OEIS [A007444](https://oeis.org/A007444):

~~~spl svg=B
1:150.prime
.moebiusTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/moebiusTransform-B.svg)

* * *

See also: binomialTransform, boustrophedonTransform, eulerTransform, runLengthTransform

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MoebiusTransform.html)

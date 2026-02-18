# moebiusTransform

- _moebiusTransform([x₁ x₂ …])_

Answer the Moebius transform of the integer sequence _x_.

Of `ones`,
OEIS [A000012](https://oeis.org/A000012),
answer `one` and then zeroes,
OEIS [A000007](https://oeis.org/A000007):

```
>>> [1 1 1 1 1 1 1 1 1 1 1 1 1]
>>> .moebiusTransform
[1 0 0 0 0 0 0 0 0 0 0 0 0]
```

Of the natural numbers,
OEIS [A000027](https://oeis.org/A000027),
answer `eulerPhi`,
OEIS [A000010](https://oeis.org/A000010):

```
>>> [1 .. 13].moebiusTransform
[1 1 2 2 4 2 6 4 6 4 10 4 12]

>>> [1 .. 13].eulerPhi
[1 1 2 2 4 2 6 4 6 4 10 4 12]
```

Of the `divisorSigma` function,
OEIS [A000203](https://oeis.org/A000203),
answer the natural numbers,
OEIS [A000027](https://oeis.org/A000027):

```
>>> [1 3 4 7 6 12 8 15 13 18 12 28 14 24]
>>> .moebiusTransform
[1 .. 14]

>>> 1.divisorSigma(1:14)
[1 3 4 7 6 12 8 15 13 18 12 28 14 24]
```

Of `one` and then `zero`,
OEIS [A000007](https://oeis.org/A000007),
answers the `moebiusMu` function,
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

Moebius transform of
OEIS [A003961](https://oeis.org/A003961),
OEIS [A003972](https://oeis.org/A003972):

```
>>> [1 3 5 9 7 15 11 27 25 21 13 45 17 33]
>>> .moebiusTransform
[1 2 4 6 6 8 10 18 20 12 12 24 16 20]
```

Moebius transform of
OEIS [A000358](https://oeis.org/A000358),
OEIS [A006206](https://oeis.org/A006206):

```
>>> [1 2 2 3 3 5 5 8 10 15 19 31 41 64 94]
>>> .moebiusTransform
[1 1 1 1 2 2 4 5 8 11 18 25 40 58 90]
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

Plot Ramanujan sum _Cn(2)_,
OEIS [A086831](https://oeis.org/A086831):

~~~spl svg=C
[1 2].padRight([63], 0)
.moebiusTransform
.discretePlot
~~~

![](sw/spl/Help/Image/moebiusTransform-C.svg)

* * *

See also: binomialTransform, boustrophedonTransform, eulerTransform, moebiusMu, runLengthTransform

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MoebiusTransform.html)

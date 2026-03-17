# moebiusTransform

- _moebiusTransform([x₁ x₂ …])_

Answer the Moebius transform,
also called the Möbius transform,
of the integer sequence _x_.

The Möbius transform of the Fibonacci numbers,
OEIS [A000045](https://oeis.org/A000045),
is
OEIS [A007436](https://oeis.org/A007436):

```
>>> 1:13.fibonacci.moebiusTransform
[1 0 1 2 4 6 12 18 32 50 88 134 232]

>>> [1 0 1 2 4 6 12 18 32 50 88 134 232]
>>> .inverseMoebiusTransform
[1 1 2 3 5 8 13 21 34 55 89 144 233]
```

The Möbius transform of the natural numbers,
OEIS [A000027](https://oeis.org/A000027),
is
OEIS [A000010](https://oeis.org/A000010):

```
>>> [1 .. 13].moebiusTransform
[1 1 2 2 4 2 6 4 6 4 10 4 12]

>>> [1 .. 13].eulerPhi
[1 1 2 2 4 2 6 4 6 4 10 4 12]

>>> [1 1 2 2 4 2 6 4 6 4 10 4 12]
>>> .inverseMoebiusTransform
[1 2 3 4 5 6 7 8 9 10 11 12 13]
```

The Möbius transform of the Euler totient function,
OEIS [A000010](https://oeis.org/A000010),
is
OEIS [A007431](https://oeis.org/A007431):

```
>>> [1 .. 13].eulerPhi.moebiusTransform
[1 0 1 1 3 0 5 2 4 0 9 1 11]

>>> [1 .. 13].moebiusTransform
>>> .moebiusTransform
[1 0 1 1 3 0 5 2 4 0 9 1 11]

>>> [1 0 1 1 3 0 5 2 4 0 9 1 11]
>>> .inverseMoebiusTransform
[1 1 2 2 4 2 6 4 6 4 10 4 12]
```

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

Moebius transform of largest difference between consecutive divisors of _n_,
OEIS [A300721](https://oeis.org/A300721):

```
>>> 1:20.collect { :n |
>>> 	n - (n / n.leastPrimeFactor)
>>> }.moebiusTransform
[
	 0  1  2  1  4  0  6  2  4  0
	10  2 12  0  4  4 16  2 18  4
]
```

Triplicate Moebius transform of the _10000…_ sequence,
OEIS [A007428](https://oeis.org/A007428):

~~~spl svg=A oeis=A007428
[1].padRight([64], 0)
.moebiusTransform
.moebiusTransform
.moebiusTransform
.discretePlot
~~~

![](Help/Image/moebiusTransform-A.svg)

Moebius transform of primes,
OEIS [A007444](https://oeis.org/A007444):

~~~spl svg=B oeis=A007444
1:150.prime
.moebiusTransform
.scatterPlot
~~~

![](Help/Image/moebiusTransform-B.svg)

Ramanujan sum _Cn(2)_,
OEIS [A086831](https://oeis.org/A086831):

~~~spl svg=C oeis=A086831
[1 2].padRight([63], 0)
.moebiusTransform
.discretePlot
~~~

![](Help/Image/moebiusTransform-C.svg)

Moebius transform of largest difference between consecutive divisors of _n_,
OEIS [A300721](https://oeis.org/A300721):

~~~spl svg=D oeis=A300721
1:85.collect { :n |
	n - (n / n.leastPrimeFactor)
}.moebiusTransform
.discretePlot
~~~

![](Help/Image/moebiusTransform-D.svg)

Moebius transform of Dedekind ψ function,
OEIS [A063659](https://oeis.org/A063659):

~~~spl svg=E oeis=A063659
1:200.dedekindPsi
.moebiusTransform
.scatterPlot
~~~

![](Help/Image/moebiusTransform-E.svg)

Moebius transform applied thrice to natural numbers,
OEIS [A007432](https://oeis.org/A007432):

~~~spl svg=F oeis=A007432
[1 .. 115].moebiusTransform
.moebiusTransform
.moebiusTransform
.discretePlot
~~~

![](Help/Image/moebiusTransform-F.svg)

Moebius transform of triangular numbers,
OEIS [A007438](https://oeis.org/A007438):

~~~spl svg=G oeis=A007438
1:115.triangularNumber
.moebiusTransform
.scatterPlot
~~~

![](Help/Image/moebiusTransform-G.svg)

Moebius transform of squares,
OEIS [A007434](https://oeis.org/A007434):

~~~spl svg=H oeis=A007434
1:115.square
.moebiusTransform
.scatterPlot
~~~

![](Help/Image/moebiusTransform-H.svg)

* * *

See also: binomialTransform, boustrophedonTransform, eulerTransform, inverseMoebiusTransform, moebiusMu, runLengthTransform

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MoebiusTransform.html),
_OEIS_
[1](https://oeis.org/wiki/M%C3%B6bius_transform)

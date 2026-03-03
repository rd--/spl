# inverseMoebiusTransform

- _inverseMoebiusTransform([x₁ x₂ …])_

Answer the inverse Moebius transform of the integer sequence _x_.

Of all `one` and `one` and then zeroes,
OEIS [A000007](https://oeis.org/A000007)
and
OEIS [A000012](https://oeis.org/A000012):

```
>>> [1 1 1 1 1 1 1 1 1 1 1 1 1]
>>> .moebiusTransform
[1 0 0 0 0 0 0 0 0 0 0 0 0]

>>> [1 0 0 0 0 0 0 0 0 0 0 0 0]
>>> .inverseMoebiusTransform
[1 1 1 1 1 1 1 1 1 1 1 1 1]
```

Of the natural numbers and `eulerPhi`,
OEIS [A000027](https://oeis.org/A000027)
and
OEIS [A000010](https://oeis.org/A000010):

```
>>> [1 .. 13].moebiusTransform
[1 1 2 2 4 2 6 4 6 4 10 4 12]

>>> [1 1 2 2 4 2 6 4 6 4 10 4 12]
>>> .inverseMoebiusTransform
[1 .. 13]
```

Of the `divisorSigma` function and the natural numbers,
OEIS [A000203](https://oeis.org/A000203)
and
OEIS [A000027](https://oeis.org/A000027):

```
>>> [1 3 4 7 6 12 8 15 13 18 12 28 14 24]
>>> .moebiusTransform
[1 .. 14]

>>> [1 .. 14]
>>> .inverseMoebiusTransform
[1 3 4 7 6 12 8 15 13 18 12 28 14 24]
```

Of `one` and then `zero` and the `moebiusMu`,
OEIS [A000007](https://oeis.org/A000007)
and
OEIS [A008683](https://oeis.org/A008683):

```
>>> [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
>>> .moebiusTransform
[1 -1 -1 0 -1 1 -1 0 0 1 -1 0 -1 1 1 0 -1]

>>> [1 -1 -1 0 -1 1 -1 0 0 1 -1 0 -1 1 1 0 -1]
>>> .inverseMoebiusTransform
[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
```

Applied twice,
OEIS [A007427](https://oeis.org/A007427):

```
>>> [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
>>> .moebiusTransform
>>> .moebiusTransform
[1 -2 -2 1 -2 4 -2 0 1 4 -2 -2 -2 4 4 0]

>>> [1 -2 -2 1 -2 4 -2 0 1 4 -2 -2 -2 4 4 0]
>>> .inverseMoebiusTransform
>>> .inverseMoebiusTransform
[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
```

Applied thrice,
OEIS [A007427](https://oeis.org/A007427):

```
>>> [1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
>>> .moebiusTransform
>>> .moebiusTransform
>>> .moebiusTransform
[1 -3 -3 3 -3 9 -3 -1 3 9 -3 -9 -3 9 9 0]

>>> [1 -3 -3 3 -3 9 -3 -1 3 9 -3 -9 -3 9 9 0]
>>> .inverseMoebiusTransform
>>> .inverseMoebiusTransform
>>> .inverseMoebiusTransform
[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
```

Moebius transform of
OEIS [A003961](https://oeis.org/A003961),
OEIS [A003972](https://oeis.org/A003972):

```
>>> [1 3 5 9 7 15 11 27 25 21 13 45 17 33]
>>> .moebiusTransform
[1 2 4 6 6 8 10 18 20 12 12 24 16 20]

>>> [1 2 4 6 6 8 10 18 20 12 12 24 16 20]
>>> .inverseMoebiusTransform
[1 3 5 9 7 15 11 27 25 21 13 45 17 33]
```

Moebius transform of
OEIS [A000358](https://oeis.org/A000358),
OEIS [A006206](https://oeis.org/A006206):

```
>>> [1 2 2 3 3 5 5 8 10 15 19 31 41 64 94]
>>> .moebiusTransform
[1 1 1 1 2 2 4 5 8 11 18 25 40 58 90]

>>> [1 1 1 1 2 2 4 5 8 11 18 25 40 58 90]
>>> .inverseMoebiusTransform
[1 2 2 3 3 5 5 8 10 15 19 31 41 64 94]
```

Inverse Möbius transform of _-1^(n+1)_,
also number of odd divisors minus number of even divisors,
OEIS [A048272](https://oeis.org/A048272):

```
>>> (-1 ^ 2:17).inverseMoebiusTransform
[1 0 2 -1 2 0 2 -2 3 0 2 -2 2 0 4 -3]
```

Inverse Möbius transform of periodic _1,-1,-3,1,-1,3,1,-1,0_,
OEIS [A123477](https://oeis.org/A123477):

~~~spl svg=A
[1 -1 -3 1 -1 3 1 -1 0]
.repeat(12)
.inverseMoebiusTransform
.discretePlot
~~~

![](sw/spl/Help/Image/inverseMoebiusTransform-A.svg)

* * *

See also: binomialTransform, boustrophedonTransform, eulerTransform, moebiusTransform, runLengthTransform

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MoebiusTransform.html)
_W_
[1](https://en.wikipedia.org/wiki/M%C3%B6bius_inversion_formula)

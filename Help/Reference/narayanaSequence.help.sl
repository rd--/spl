# narayanaSequence

- _narayanaSequence(n)_

Answer the first _n_ elements of the Narayana sequence.

The first few elements:

```
>>> 23.narayanaSequence
[
	1 1 1 2 3 4 6 9 13 19
	28 41 60 88 129 189 277 406 595 872
	1278 1873 2745
]
```

The limit ratio between consecutive terms is the supergolden ratio:

```
>>> 2745/1873
1.supergoldenRatio
```

Plot first few terms:

~~~spl svg=A
23.narayanaSequence.linePlot
~~~

![](sw/spl/Help/Image/narayanaSequence-A.svg)

* * *

See also: fibonacciSequence, narayanaNumber, padovanSequence, supergoldenRatio

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NarayanaCowSequence.html),
_OEIS_
[1](https://oeis.org/A000930)

Categories: Math, Sequence

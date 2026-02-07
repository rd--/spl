# golombsSequence

- _golombsSequence(n)_

Answer the first _n_ terms of Golomb’s sequence,
also called Silverman’s sequence.

First few terms,
OEIS [A001462](https://oeis.org/A001462):

```
>>> 84.golombsSequence
[
	 1  2  2  3  3  4  4  4  5  5
	 5  6  6  6  6  7  7  7  7  8
	 8  8  8  9  9  9  9  9 10 10
	10 10 10 11 11 11 11 11	12 12
	12 12 12 12 13 13 13 13 13 13
	14 14 14 14 14 14 15 15 15 15
	15 15 16 16 16 16 16 16 16 17
	17 17 17 17 17 17 18 18 18 18
	18 18 18 19
]
```

Partial sums,
OEIS [A001463](https://oeis.org/A001463):

```
>>> 20.golombsSequence.prefixSum
[
	 1  3  5  8 11 15 19 23 28 33
	38 44 50 56 62 69 76 83 90 98
]
```

The asymptotic value of the _n_-th term:

```
>>> let phi = 1.goldenRatio;
>>> 1:84.collect { :n |
>>> 	(phi ^ (2 - phi)) * (n ^ (phi - 1))
>>> }.round
84.golombsSequence
```

Plot first few terms:

~~~spl svg=A
98.golombsSequence
.discretePlot
~~~

![](sw/spl/Help/Image/golombsSequence-A.svg)

Asymptotic expression for the _n_-the term:

```
>>> let phi = 1.goldenRatio;
>>> let n = 256;
>>> let z = n.golombsSequence.last;
>>> (z, (phi ^ (2 - phi)) * (n ^ (phi - 1)))
(37, 36.9999)
```

* * *

See also: kolakoskiSequence

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SilvermansSequence.html),
_OEIS_
[1](https://oeis.org/A001462)
[2](https://oeis.org/A001463),
_W_
[1](https://en.wikipedia.org/wiki/Golomb_sequence)

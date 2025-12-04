# sobolSequence

- _sobolSequence(n, k)_
- _sobolSequence([m n])_

Answer a Sobol sequence.
In the binary case answer the first _n_ terms of the _k_-th dimension.
In the unary case answer the _m×n_ matrix where each row has the _i_-th entry for each of the first _n_ dimensions.
Sobol’ sequences are a type of quasi-random low-discrepancy sequence.

First few terms of first dimension:

```
>>> sobolSequence(16, 1)
[
	0     1/2   3/4  1/4
	3/8   7/8   5/8  1/8
	3/16 11/16 15/16 7/16
	5/16 13/16  9/16 1/16
]
```

Numerators,
OEIS [A280995](https://oeis.org/A280995):

```
>>> sobolSequence(16, 1).numerator
[0 1 3 1 3 7 5 1 3 11 15 7 5 13 9 1]
```

Denominators,
[A062383](https://oeis.org/A062383):

```
>>> sobolSequence(16, 1).denominator
[1 2 4 4 8 8 8 8 16 16 16 16 16 16 16 16]
```

First few terms of first dimension:

```
>>> sobolSequence(16, 2)
[
	0 1/2 1/4 3/4
	3/8 7/8 1/8 5/8
	5/16 13/16 1/16 9/16
	3/16 11/16 7/16 15/16
]
```

Numerators:

```
>>> sobolSequence(16, 2).numerator
[0 1 1 3 3 7 1 5 5 13 1 9 3 11 7 15]
```

Step plot of first few terms of first dimension:

~~~spl svg=A
sobolSequence(64, 1)
.stepPlot
~~~

![](sw/spl/Help/Image/sobolSequence-A.svg)

Scatter plot of first few terms of two-dimensional sequence:

~~~spl svg=B
[128 2].sobolSequence
.scatterPlot
~~~

![](sw/spl/Help/Image/sobolSequence-B.svg)

* * *

See also: bitAnd, bitLength, bitXor, rulerFunction, sobolSequenceData

Guides: Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A280995)
[2](https://oeis.org/A062383),
_W_
[1](https://en.wikipedia.org/wiki/Sobol_sequence)

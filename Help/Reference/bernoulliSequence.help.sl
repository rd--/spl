# bernoulliSequence

- _bernoulliSequence(n)_

Answer the first _n_ Bernoulli numbers,
following the NIST sign convention (the second term, _B(1)_, is _-1/2_).

First eleven Bernoulli numbers:

```
>>> 11.bernoulliSequence
[1 -1/2 1/6 0 -1/30 0 1/42 0 -1/30 0 5/66]
```

First few non-zero Bernoulli numbers:

```
>>> 16.bernoulliSequence.reject(isZero:/1)
[
	1 -1/2 1/6 -1/30 1/42
	-1/30 5/66 -691/2730 7/6
]
```

Plot numerator:

~~~spl svg=A
99.bernoulliSequence
.numerator
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliSequence-A.svg)

Plot denominator:

~~~spl svg=B
99.bernoulliSequence
.denominator
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliSequence-B.svg)

* * *

See also: bernoulliNumber, bernoulliPolynomial

Guides: Integer Sequences, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliNumber.html)
[2](https://reference.wolfram.com/language/ref/BernoulliB.html),
_OEIS_
[1](https://oeis.org/A027641)
[1](https://oeis.org/A027642)

Categories: Math, Sequence

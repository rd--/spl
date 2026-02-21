# aliquotSum

- _aliquotSum(n)_

Answer the aliquot sum of the positive integer _n_,
the sum of all proper divisors of _n_.

First few terms,
OEIS [A001065](https://oeis.org/A001065):

```
>>> 1:23.collect(aliquotSum:/1)
[
	0 1 1 3 1 6 1 7 4 8
	1 16 1 10 9 15 1 21 1 22
	11 14 1
]

>>> 25.aliquotSum
6
```

Plot first few terms:

~~~spl svg=A
1:119.collect(aliquotSum:/1).linePlot
~~~

![](sw/spl/Help/Image/aliquotSum-A.svg)

* * *

See also: aliquotSequence, divisorSigma, isAbundantNumber

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RestrictedDivisorFunction.html),
_OEIS_
[1](https://oeis.org/A001065),
_W_
[1](https://en.wikipedia.org/wiki/Aliquot_sum)

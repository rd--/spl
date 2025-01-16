# bernoulliSequence

- _bernoulliSequence(anInteger)_

Answer the first _anInteger_ Bernoulli numbers.

```
>>> 15.bernoulliSequence.reject(isZero:/1)
[
	1/1 1/2 1/6 -1/30 1/42
	-1/30 5/66 -691/2730 7/6
]

>>> 60.bernoulliSequence.last
-1215233140483755572040304994079820246041491n
/
56786730n
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
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliSequence-B.svg)

* * *

See also: bernoulli

Guides: Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliNumber.html)
[2](https://reference.wolfram.com/language/ref/BernoulliB.html),
_OEIS_
[1](https://oeis.org/A027641)
[1](https://oeis.org/A027642)

Categories: Math, Sequence

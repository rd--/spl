# leastExcludedSequence

- _leastExcludedSequence(i, k, f/3)_

Answer _k_ terms of the the integer sequence,
initially _i_,
where each subsequent term if the least excluded value satisfying the block _f(a, n, m)_,
where _a_ is the sequence up to _n-1_,
_n_ is the index of the term being decided,
and _m_ is the candidate least excluded value.

Least excluded sequence such that the `gcd` of adjacent terms is _≥3_,
OEIS [A064417](https://oeis.org/A064417):

```
>>> [1L 2L 3L]
>>> .leastExcludedSequence(23L) { :a :n :m |
>>> 	m.gcd(a[n - 1L]) >= 3L
>>> }
[
	 1  2  3  6  9 12  4  8 16 20
	 5 10 15 18 21  7 14 28 24 27
	30 25 35
]
```

Least excluded sequence such that the `gcd` of adjacent terms is _≥3_,
OEIS [A064417](https://oeis.org/A064417):

~~~spl svg=A oeis=A064417
[1L 2L 3L]
.leastExcludedSequence(185L) { :a :n :m |
	m.gcd(a[n - 1L]) >= 3L
}.scatterPlot
~~~

![](Help/Image/leastExcludedSequence-A.svg)

Least excluded sequence such that the `gcd` of adjacent terms is _≠1_,
called the Ekg sequence,
OEIS [A064413](https://oeis.org/A064413):

~~~spl svg=B oeis=A064413
[1L 2L]
.leastExcludedSequence(185L) { :a :n :m |
	m.gcd(a[n - 1L]) != 1L
}.scatterPlot
~~~

![](Help/Image/leastExcludedSequence-B.svg)

Least excluded sequence such that adjacent terms are part of a Pythagorean triple,
OEIS [A235598](https://oeis.org/A235598):

~~~spl svg=C oeis=A235598
[3L]
.leastExcludedSequence(40L) { :a :n :m |
	let [p, q] = [a[n - 1L], m].square;
	(p + q).isPerfectSquare | {
		(q - p).abs.sqrt
		.isIntegerValuedNumber
	}
}.discretePlot.log
~~~

![](Help/Image/leastExcludedSequence-C.svg)

Least excluded sequence such that
adjacent terms have no adjacent ones in the binary expansion of their product,
OEIS [A269361](https://oeis.org/A269361):

~~~spl svg=D oeis=A269361
[1L].leastExcludedSequence(115L) { :a :n :m |
	(a[n - 1L] * m).integerDigits(2L)
	.sequenceCount([1L 1L]) = 0L
}.discretePlot
~~~

![](Help/Image/leastExcludedSequence-D.svg)

Least excluded sequence such that
adjacent terms have no isolated ones in the binary expansion of their product,
OEIS [A289194](https://oeis.org/A289194):

~~~spl svg=E oeis=A289194
[1L].leastExcludedSequence(150L) { :a :n :m |
	(a[n - 1L] * m).binaryExpansion
	.runLengthsOf(1L)
	.min >= 2L
}.scatterPlot
~~~

![](Help/Image/leastExcludedSequence-E.svg)

* * *

See also: Map, detect, includes

Guides: Integer Sequence Functions

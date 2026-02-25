# leastExcludedSequence

- _leastExcludedSequence(i, k, f:/3)_

Answer _k_ terms of the the integer sequence,
initially _i_,
where each subsequent term if the least excluded value satisfying the block _f(a, n, m)_,
where _a_ is the sequence up to _n-1_,
_n_ is the index of the term being decided,
and _m_ is the candidate least excluded value.

Least excluded sequence such that the `gcd` of adjacent terms is _≥3_,
OEIS [A064417](https://oeis.org/A064417):

~~~spl svg=A
[1 2 3]
.leastExcludedSequence(185) { :a :n :m |
	m.gcd(a[n - 1]) >= 3
}.scatterPlot
~~~

![](sw/spl/Help/Image/leastExcludedSequence-A.svg)

Least excluded sequence such that the `gcd` of adjacent terms is _≠1_,
called the Ekg sequence,
OEIS [A064413](https://oeis.org/A064413):

~~~spl svg=B
[1 2]
.leastExcludedSequence(185) { :a :n :m |
	m.gcd(a[n - 1]) != 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/leastExcludedSequence-B.svg)

* * *

See also: detect, includes, Map

Guides: Integer Sequence Functions

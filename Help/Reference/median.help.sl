# median

- _median([x₁ x₂ …])_

When the sequence _x_ is sorted the median is given by the `middle` element if the sequence length is odd,
and the `mean` of the two center elements if it is even.

Odd length sequence:

```
>>> (1:7.median, 1:7[4], 1:7.middle)
(4, 4, 4)
```

Even length sequence:

```
>>> (
>>> 	1:8.median,
>>> 	(1:8[4] + 1:8[5]) / 2,
>>> 	1:8.middle(2).mean
>>> )
(4.5, 4.5, 4.5)

>>> [3 -4 1 4 22 17 -2 2 13 -11]
>>> .median
5/2

>>> [-20 -24 0 4 24 36 -12 -12 56 -14]
>>> .median
-6
```

Find the `median` for the heights of children in a class:

```
>>> [
>>> 	134 143 131 140 145
>>> 	136 131 136 143 136
>>> 	133 145 147 150 150
>>> 	146 137 143 132 142
>>> 	145 136 144 135 141
>>> ].median
141
```

Note that `median` sorts the input sequence:

```
>>> [1 7 6 2 3 5 4].median
4

>>> [1 2 3 4 5 6 7].median
4
```

Median prime factor of _1:n_,
OEIS [A212300](https://oeis.org/A212300):

~~~spl svg=A
3:150.collect { :n |
	let m = 1:n.collect { :k |
		k.greatestPrimeFactor
	}.median;
	(m + 0.5).ceiling.previousPrime
}.stepPlot
~~~

![](sw/spl/Help/Image/median-A.svg)

Triangle where _(n,k)_ is the number of integer partitions of _n_ with median _k_,
where _k_ ranges from one to _n_ in steps of one half,
OEIS [A359893](https://oeis.org/A359893):

~~~spl svg=A
Range(1, 10, 1).collect { :n |
	Range(1, n, 1/2).collect { :k |
		n.integerPartitions.select { :p |
			p.median = k
		}.size
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/median-B.svg)

* * *

See also: asSortedList, isEven, isOdd, mean, middle

Guides: Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Median.html)
[2](https://mathworld.wolfram.com/StatisticalMedian.html)
[3](https://reference.wolfram.com/language/ref/Median.html)
_W_
[1](https://en.wikipedia.org/wiki/Median)
[2](https://en.wikipedia.org/wiki/Weighted_median)

Categories: Statistics

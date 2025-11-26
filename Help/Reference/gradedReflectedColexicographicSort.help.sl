# gradedReflectedColexicographicSort

- _gradedReflectedColexicographicSort(s)_

Answer the graded, reflected colexicographic sort of the sequence _s_.
Also called the Abramowitz and Stegun ordering.

Sort the integer partitions of six:

```
>>> 6.integerPartitions
>>> .gradedReflectedColexicographicSort
[
	6;
	1 5;
	2 4;
	3 3;
	1 1 4;
	1 2 3;
	2 2 2;
	1 1 1 3;
	1 1 2 2;
	1 1 1 1 2;
	1 1 1 1 1 1
]
```

The multinomial coefficients for the partitions of _n_ listed in Abramowitz-Stegun order,
OEIS [A036038](https://oeis.org/A036038):

```
>>> 1:6.collect { :n |
>>> 	n.integerPartitions
>>> 	.gradedReflectedColexicographicSort
>>> 	.collect(multinomial:/1)
>>> }
[
	1;
	1 2;
	1 3 6;
	1 4 6 12 24;
	1 5 10 20 30 60 120;
	1 6 15 20 30 60 90 120 180 360 720
]
```

Plot:

~~~spl svg=A
1:9.collect { :n |
	n.integerPartitions
	.gradedReflectedColexicographicSort
	.collect(multinomial:/1)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/gradedReflectedColexicographicSort-A.svg)

* * *

See also: sort

Guides: Types of Orderings

References:
_OEIS_
[1](https://oeis.org/wiki/Orderings_of_partitions)
[2](https://oeis.org/A036038)

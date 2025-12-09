# restrictedGrowthStrings

- _restrictedGrowthStrings(n)_
- _restrictedGrowthStrings(n, k)_

Answer the restricted growth strings of length _n_ in lexicographic order.

The five strings of length three:

```
>>> 3.restrictedGrowthStrings
[
	1 1 1;
	1 1 2;
	1 2 1;
	1 2 2;
	1 2 3
]

>>> 3.bellNumber
5
```

The fifteen strings of length four,
in lexicographic order:

```
>>> 4.restrictedGrowthStrings
[
	1 1 1 1;
	1 1 1 2;
	1 1 2 1;
	1 1 2 2;
	1 1 2 3;
	1 2 1 1;
	1 2 1 2;
	1 2 1 3;
	1 2 2 1;
	1 2 2 2;
	1 2 2 3;
	1 2 3 1;
	1 2 3 2;
	1 2 3 3;
	1 2 3 4
]

>>> 4.bellNumber
15
```

The binary form answers the string of length _n_ that partition into _k_ blocks:

```
>>> restrictedGrowthStrings(4, 3)
[
	1 1 2 3;
	1 2 1 3;
	1 2 2 3;
	1 2 3 1;
	1 2 3 2;
	1 2 3 3
]

>>> stirlingS2(4, 3)
6
```

A restricted growth string can be used to describe a set partition:

```
>>> [1 2 3 3].setPartition
[1; 2; 3 4]

>>> 4.restrictedGrowthStrings
>>> .collect(setPartition:/1)
[
	1 2 3 4:;
	1 2 3; 4:;
	1 2 4; 3:;
	1 2; 3 4:;
	1 2; 3; 4:;
	1 3 4; 2:;
	1 3; 2 4:;
	1 3; 2; 4:;
	1 4; 2 3:;
	1; 2 3 4:;
	1; 2 3; 4:;
	1 4; 2; 3:;
	1; 2 4; 3:;
	1; 2; 3 4:;
	1; 2; 3; 4
]
```

Plot the fifteen _5,2_ restricted growth strings,
interpreted as set partitions:

~~~spl svg=A
restrictedGrowthStrings(5, 2)
.collect { :each |
	each.setPartition
	.partitionPlot
}.PlotSet([3 5])
~~~

![](sw/spl/Help/Image/restrictedGrowthStrings-A.svg)

Plot the fifteen four letter restricted growth strings,
interpreted as set partitions:

~~~spl svg=B
4.restrictedGrowthStrings
.collect { :each |
	each.setPartition
	.partitionPlot
}.PlotSet([3 5])
~~~

![](sw/spl/Help/Image/restrictedGrowthStrings-B.svg)

* * *

See also: bellNumber, isRestrictedGrowthString, setPartitions

Guides: Combinatorial Functions

References:
_Mathematica_
[1](http://mathworld.wolfram.com/RestrictedGrowthString.html)

Further Reading: Hutchinson 1963, Knuth 2011

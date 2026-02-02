# dysonCrank

- _dysonCrank(p)_

Answer the Dyson crank of the integer partition _p_.

```
>>> [5 3 1 1 1].dysonCrank
-2
```

Dyson cranks for integer paritions of four through six:

```
>>> 4.integerPartitions
>>> .collect(dysonCrank:/1)
[4 0 2 -2 -4]

>>> 5.integerPartitions
>>> .collect(dysonCrank:/1)
[5 0 3 -1 1 -3 -5]

>>> 6.integerPartitions
>>> .collect(dysonCrank:/1)
[6 0 4 -1 3 1 -3 2 -2 -4 -6]
```

Dyson cranks for integer paritions of nine:

```
>>> 9.integerPartitions
>>> .collect(dysonCrank:/1)
[
	 9  0  7 -1  6  1 -2  5  1  5
	-1 -3  1  4  0  2 -2 -5  3  2
	-3  3 -1 -4 -6  3 -3 -5 -7 -9
]
```

Andrews and Garvan proved that the partitions of a number of the form _11m+6_ can be split into 11 sets of equal size according to the crank modulo 11:

```
>>> let p = 17.integerPartitions;
>>> let c = p.collect(dysonCrank:/1);
>>> (c % 11).sort.asRunArray
RunArray(
	[27 27 27 27 27 27 27 27 27 27 27],
	[0 1 2 3 4 5 6 7 8 9 10]
)
```

Number of partitions of _n_ with crank _k_ for _k_ in _-n:n_,
OEIS [A064391](https://oeis.org/A064391):

~~~spl svg=A
1:9.collect { :n |
	let p = n.integerPartitions;
	let c = p.collect(dysonCrank:/1);
	-n:n.collect { :k |
		c.occurrencesOf(k)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/dysonCrank-A.svg)

* * *

See also: integerPartitions

Guides: Partition Functions

References:
_OEIS_
[1](https://oeis.org/A064391),
_W_
[1](https://en.wikipedia.org/wiki/Crank_of_a_partition)

Further Reading: Dyson 1944

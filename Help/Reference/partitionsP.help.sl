# partitionsP

- _partitionsP(x)_

Answer the number of partitions of _x_ into distinct parts.
An alias for the unary form of `partitionFunctionP`.

```
>>> 50.partitionsP
204226

>>> [2 4 6].collect(partitionsP:/1)
[2 5 11]
```

Threads over lists, first few terms of
OEIS [A000041](https://oeis.org/A000041):

```
>>> 0:12.partitionsP
[1 1 2 3 5 7 11 15 22 30 42 56 77]
```

`partitionsP` gives the length of `integerPartitions` with nonrepeating parts:

```
>>> 5.integerPartitions
[
	5;
	4 1;
	3 2; 3 1 1;
	2 2 1; 2 1 1 1;
	1 1 1 1 1
]

>>> 5.partitionsP
7
```

Ramanujan discovered and proved analytically that the number of partitions of _11n+6_ is divisible by 11:

```
>>> 6:100:11.partitionsP
[
	11 297 3718 31185 204226
	1121505 5392783 23338469 92669720
]

>>> 6:100:11.partitionsP / 11
[
	1 27 338 2835 18566
	101955 490253 2121679 8424520
]
```

Plot the number of restricted partitions,
`log` scaled:

~~~spl svg=A
1:33.partitionsP.log.discretePlot
~~~

![](sw/spl/Help/Image/partitionsP-A.svg)

Successive differences of `partitionsP` modulo two:

~~~spl svg=B
let n = 31;
(
	{ :x |
		x
		.differences
		.padRight([n], 0)
	}.nestList(
		1:n.partitionsP,
		n
	) % 2
).matrixPlot
~~~

![](sw/spl/Help/Image/partitionsP-B.svg)

A walk based on `partitionsP`:

~~~spl svg=C
let n = 37;
(1:n.partitionsP.i * 3.4.pi)
.exp
.accumulate
.realImaginary
.linePlot
~~~

![](sw/spl/Help/Image/partitionsP-C.svg)

* * *

See also: integerPartitions, partitionFunctionP, partitionsQ

Guides: Combinatorial Functions, Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PartitionFunctionP.html)
[2](https://reference.wolfram.com/language/ref/PartitionsP.html),
_OEIS_
[1](https://oeis.org/A000041),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.partition)

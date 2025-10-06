# partitionsQ

- _partitionsQ(x)_

Answer the number of restricted partitions of _x_ into distinct parts.
An alias for the unary form of `partitionFunctionQ`.

```
>>> [2 4 6].collect(partitionsQ:/1)
[1 2 4]
```

Threads over lists:

```
>>> 0:12.partitionsQ
[1 1 1 2 2 3 4 5 6 8 10 12 15]
```

`partitionsQ` gives the length of `integerPartitions` with nonrepeating parts:

```
>>> 5.integerPartitions
[5; 4 1; 3 2; 3 1 1; 2 2 1; 2 1 1 1; 1 1 1 1 1]

>>> 5.partitionsQ
3
```

Plot the number of restricted partitions:

~~~spl svg=A
1:47.partitionsQ.log.discretePlot
~~~

![](sw/spl/Help/Image/partitionsQ-A.svg)

Successive differences of `partitionsQ` modulo two:

~~~spl png=B
let n = 47;
(
	{ :x |
		x.differences.padRight([n], 0)
	}.nestList(1:n.partitionsQ, n) % 2
).Bitmap
~~~

![](sw/spl/Help/Image/partitionsQ-B.png)

A walk based on `partitionsQ`:

~~~spl svg=C
let n = 47;
(1:n.partitionsQ.i * 3.4.pi)
.exp
.accumulate
.realImaginary
.linePlot
~~~

![](sw/spl/Help/Image/partitionsQ-C.svg)

* * *

See also: partitionFunctionQ, partitionsP

Guides: Combinatorial Functions, Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PartitionFunctionQ.html)
[2](https://reference.wolfram.com/language/ref/PartitionsQ.html),
_OEIS_
[1](https://oeis.org/A000009)

Categories: Combinatorics, Math

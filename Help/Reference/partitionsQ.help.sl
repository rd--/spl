# partitionsQ

- _partitionsQ(anInteger)_

Answer the number of restricted partitions of _anInteger_ into distinct parts.

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
1:47.partitionsQ.logScale.discretePlot
~~~

![](sw/spl/Help/Image/partitionsQ-A.svg)

Successive differences of `partitionsQ` modulo two:

~~~spl svg=B
let n = 47;
({ :x |
	x.differences.padRight(n, 0)
}.nestList(1:n.partitionsQ, n) % 2).matrixPlot
~~~

![](sw/spl/Help/Image/partitionsQ-B.svg)

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

Guides: Mathematical Functions

# partitionsP

- _partitionsP(anInteger)_

Answer the number of partitions of _anInteger_ into distinct parts.

```
>>> [2 4 6].collect(partitionsP:/1)
[2 5 11]
```

Threads over lists:

```
>>> 0:12.partitionsP
[1 1 2 3 5 7 11 15 22 30 42 56 77]
```

`partitionsP` gives the length of `integerPartitions` with nonrepeating parts:

```
>>> 5.integerPartitions
[5; 4 1; 3 2; 3 1 1; 2 2 1; 2 1 1 1; 1 1 1 1 1]

>>> 5.partitionsP
7
```

Plot the number of restricted partitions:

~~~spl svg=A
1:33.partitionsP.logScale.discretePlot
~~~

![](sw/spl/Help/Image/partitionsP-A.svg)

Successive differences of `partitionsP` modulo two:

~~~spl svg=B
let n = 31;
({ :x |
	x.differences.padRight([n], 0)
}.nestList(1:n.partitionsP, n) % 2).matrixPlot
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

See also: partitionFunctionP, partitionsQ

# integerSequencePlot

- _integerSequencePlot([n₁ n₂ …], kind)_

Plot the integer sequence _n_.
Answers `matrixPlot` of `integerSequenceMatrix`.

Plot two cycles of the squares modulo thirty:

~~~spl svg=A
1:60.square.mod(30, 1)
.integerSequencePlot('ColumnReverse')
~~~

![](sw/spl/Help/Image/integerSequencePlot-A.svg)

This residue sequence has only twelve distinct values:

```
>>> 1:60.square.mod(30, 1)
>>> .deleteDuplicates
[1 4 9 16 25 6 19 21 10 24 15 30]
```

The sequence can be _compressed_,
whereby values are moved down to fill in gaps:

~~~spl svg=B
1:60.square.mod(30, 1)
.integerSequenceCompress
.integerSequencePlot('ColumnReverse')
~~~

![](sw/spl/Help/Image/integerSequencePlot-B.svg)

The sequence can also be _normalized_,
whereby each distinct term is assigned a consecutive integer value from one in turn:

~~~spl svg=C
1:60.square.mod(30, 1)
.integerSequenceNormalize
.integerSequencePlot('ColumnReverse')
~~~

![](sw/spl/Help/Image/integerSequencePlot-C.svg)

The Pisano period tells the period of the Fibonacci sequence at a give modulus:

```
>>> 8.pisanoPeriod
12

>>> 12.pisanoPeriod
24
```

Plot four cycles of the Fibonacci sequence modulo eight:

~~~spl svg=D
1:48.fibonacci.mod(8, 1)
.integerSequencePlot('ColumnReverse')
~~~

![](sw/spl/Help/Image/integerSequencePlot-D.svg)

Plot two cycles of the Fibonacci sequence modulo twelve:

~~~spl svg=E
1:48.fibonacci.mod(12, 1)
.integerSequencePlot('ColumnReverse')
~~~

![](sw/spl/Help/Image/integerSequencePlot-E.svg)

* * *

See also: integerSequenceMatrix, matrixPlot, scatterPlot

Guides: Plotting Functions

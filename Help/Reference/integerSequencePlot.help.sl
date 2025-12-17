# integerSequencePlot

- _integerSequencePlot([n₁ n₂ …], k)_

Plot the integer sequence _n_.
Answers `matrixPlot` of `integerSequenceMatrix`.
If _k_ is elided it is set to _'RowReverse'_,
making the plot equivalent to `scatterPlot`.

Plot two cycles of the squares modulo thirty:

~~~spl svg=A
1:60.square.mod(30, 1)
.integerSequencePlot
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
.integerSequencePlot
~~~

![](sw/spl/Help/Image/integerSequencePlot-B.svg)

The sequence can also be _normalized_,
whereby each distinct term is assigned a consecutive integer value from one in turn:

~~~spl svg=C
1:60.square.mod(30, 1)
.integerSequenceNormalize
.integerSequencePlot
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
.integerSequencePlot
~~~

![](sw/spl/Help/Image/integerSequencePlot-D.svg)

Plot two cycles of the Fibonacci sequence modulo twelve:

~~~spl svg=E
1:48.fibonacci.mod(12, 1)
.integerSequencePlot
~~~

![](sw/spl/Help/Image/integerSequencePlot-E.svg)

The implicit value of _k_ is 'RowReverse'.
'Row' indicates that the sequence items tell the indices of the non-zero rows in each column,
and 'Reverse' that the rows should be counted in reverse to the usual manner,
so that the last or lowest row has index one,
here one indicates the last row and seven the first:

~~~spl svg=F
[1 .. 7].repeat(6)
.integerSequencePlot('RowReverse')
~~~

![](sw/spl/Help/Image/integerSequencePlot-F.svg)

With _k='Row'_,
here one indicates the first row and seven the last:

~~~spl svg=G
[1 .. 7].repeat(6)
.integerSequencePlot('Row')
~~~

![](sw/spl/Help/Image/integerSequencePlot-G.svg)

With _k='ColumnReverse'_,
here one indicates the last column and four the first:

~~~spl svg=H
[1 2 3 4 3 2].repeat(4)
.integerSequencePlot('ColumnReverse')
~~~

![](sw/spl/Help/Image/integerSequencePlot-H.svg)

With _k='Column'_,
here one indicates the first column and four the last:

~~~spl svg=I
[1 2 3 4 3 2].repeat(4)
.integerSequencePlot('Column')
~~~

![](sw/spl/Help/Image/integerSequencePlot-I.svg)

* * *

See also: integerSequenceMatrix, matrixPlot, scatterPlot

Guides: Integer Sequence Functions, Plotting Functions

# circularMatrixPlot

- _circularMatrixPlot(m)_

Answer a circular matrix plot of the matrix _m_.
Each row is represented as a sector,
read outwards from the center,
and each column as a ring,
read counter-clockwise from three o’clock.

Plot all zero matrix:

~~~spl svg=A
[0].reshape([8 3])
.circularMatrixPlot
~~~

![](sw/spl/Help/Image/circularMatrixPlot-A.svg)

Plot binary gray code matrix:

~~~spl svg=B
3.binaryReflectedGrayCode
.circularMatrixPlot
~~~

![](sw/spl/Help/Image/circularMatrixPlot-B.svg)

Plot the length vectors of the five chord diagrams of order three:

~~~spl svg=C
3.chordDiagrams
.collect(lengthVector:/1)
.circularMatrixPlot
~~~

![](sw/spl/Help/Image/circularMatrixPlot-C.svg)

* * *

See also: matrixPlot

Guides: Plotting Functions

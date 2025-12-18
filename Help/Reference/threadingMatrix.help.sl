# threadingMatrix

- _threadingMatrix(w)_

Answer the threading matrix of a weaving information file.

The threading matrix is specified in column order.
In the matrix below the first entry says that warp one goes through the heddle in shaft eight.

~~~spl svg=A
WeavingInformationFile (
	'WEAVING':
		(
			'Treadles': 8,
			'Shafts': 8
		),
	'THREADING':
		(
			'1': 8,
			'2': 7,
			'3': 6,
			'4': 5,
			'5': 4,
			'6': 3,
			'7': 2,
			'8': 1
		)
).threadingMatrix.matrixPlot
~~~

![](sw/spl/Help/Image/threadingMatrix-A.svg)

Note that ordinarily weaving drafts draw the threading matrix in reverse row order,
with the last row highest.
In some cases the drawing is also right to left,
that is each column is reversed.

* * *

See also: drawdownMatrix, liftplanMatrix, tieupMatrix, WeavingInformationFile

Guides: Matrix Functions

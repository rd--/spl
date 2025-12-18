# tieupMatrix

- _tieupMatrix(w)_

Answer the tieup matrix of a weaving information file.
The tieup matrix is specified which shafts are tied to each treadle.
That is,
the tieup matrix is specified in column order,
with rows counted from last to first.
In the matrix below the first entry says that
shafts one, five, six and seven are tied to treadle one,
or equally that in column one rows two, three, four and eight are non-zero:

~~~spl svg=A
WeavingInformationFile (
	'WEAVING':
		(
			'Treadles': 8,
			'Shafts': 8
		),
	'TIEUP':
		(
			'1': '1,5,6,7',
			'2': '2,6,7,8',
			'3': '1,3,7,8',
			'4': '1,2,4,8',
			'5': '1,2,3,5',
			'6': '2,3,4,6',
			'7': '3,4,5,7',
			'8': '4,5,6,8'
		)
).tieupMatrix.matrixPlot
~~~

![](sw/spl/Help/Image/tieupMatrix-A.svg)

* * *

See also: drawdownMatrix, WeavingInformationFile

Guides: Matrix Functions

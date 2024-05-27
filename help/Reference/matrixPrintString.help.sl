# matrixPrintString

- _matrixPrintString(aMatrix)_

Answer a string representing _aMatrix_, giving dimensions, and aligning columns.

Of integer matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9].matrixPrintString.lines
[
	'3×3'
	'   '
	'   1   2   3'
	'   4   5   6'
	'   7   8   9'
]
```

Of real matrix:

```
>>> [1 2 3; 4 2 2; 5 1 7].inverse.matrixPrintString.lines
[
	'3×3'
	'   '
	'   -0.2857    0.2619    0.4760'
	'    0.4286    0.1905   -0.2381'
	'    0.1429   -0.2143    0.1429'
]
```

* * *

See also: Matrix, printString, storeString

Categories: Printing

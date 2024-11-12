# matrixPrintString

- _matrixPrintString(aMatrix, decimalPlaces=4)_

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
	'   -0.2857    0.2619    0.0476'
	'    0.4286    0.1905   -0.2381'
	'    0.1429   -0.2143    0.1429'
]
```

Of `Complex` matrix:

```
>>> 10J10.atRandom([3 2], Sfc32(69197)).matrixPrintString.lines
[
	'3×2',
	'   ',
	'   2.0509J6.2811   4.4260J6.8297',
	'   2.9664J1.9492   0.7571J3.2588',
	'   8.7879J0.4013   7.8191J3.0151'
]
```

* * *

See also: Matrix, printString, storeString

Categories: Printing

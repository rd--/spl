# accumulate

- _accumulate(aSequence)_

Gives a list of the successive accumulated totals of elements in _aSequence_.
_accumulate(x)_ is effectively equivalent to _scan(+, x)_.

Triangular numbers:

	1:10.accumulate = [1 3 6 10 15 21 28 36 45 55]
	1:10.scan(+) = [1 3 6 10 15 21 28 36 45 55]

Diagonals of Pascal’s triangle:

	accumulate:/1.nestList(1:5, 5).transposed = [1 1 1 1 1 1; 2 3 4 5 6 7; 3 6 10 15 21 28; 4 10 20 35 56 84; 5 15 35 70 126 210]

* * *

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Accumulate.html)

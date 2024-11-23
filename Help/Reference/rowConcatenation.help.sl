# rowConcatenation

- _rowConcatenation(aSequence)_

Concatenate matrices horizontally, ie. concatenate rows.
Each item in _aSequence_ should have the same number of rows.

Join three 2×1 column vectors into a 2×3 matrix:

```
>>> [1; 2:; 3; 4:; 5; 6].rowConcatenation
[
	1 3 5;
	2 4 6
]
```

Join three 1×2 row vectors into a 1×6 matrix:

```
>>> [1 2:; 3 4:; 5 6].rowConcatenation
[[1 2 3 4 5 6]]
```

Join three 2×2 matrices into a 2×6 matrix:

```
>>> [0 0; 0 0:; 1 2; 3 4:; 5 6; 7 8].rowConcatenation
[
	0 0 1 2 5 6;
	0 0 3 4 7 8
]
```

Join 2×2, 2×3 and 2×1 matrices horizontally into a 2×6 matrix:

```
>>> [1 2; 3 4:; 5 6 7; 8 9 0:; 1; 2].rowConcatenation
[
	1 2 5 6 7 1;
	3 4 8 9 0 2
]
```

* * *

See also: ++, concatenation

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/arrays/#Base.hcat),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/double.horzcat.html)
[2](https://au.mathworks.com/help/matlab/ref/double.cat.html)

Categories: Converting

# fill

- _fill(f/1, ⍴)_

Allocate an array of the indicated shape _⍴_,
and fill each cell by applying the unary block _f_ to the deep index of the cell.

List of squares of indices with literal block,
compare to `array` and `table`:

```
>>> { :i | i * i }.fill([9])
[1; 4; 9; 16; 25; 36; 49; 64; 81]

>>> { :i | i * i }.array([9])
[1 4 9 16 25 36 49 64 81]

>>> { :i | i * i }.table(1:9)
[1 4 9 16 25 36 49 64 81]
```

List of squares of indices with named method:

```
>>> square/1.fill([9])
[1; 4; 9; 16; 25; 36; 49; 64; 81]

>>> square/1.array([9])
[1 4 9 16 25 36 49 64 81]
```

List of negated indices:

```
>>> negate/1.fill([9])
[-1; -2; -3; -4; -5; -6; -7; -8; -9]

>>> negate/1.array([9])
[-1 -2 -3 -4 -5 -6 -7 -8 -9]
```

Constant list:

```
>>> 0.constant.fill([9])
[0 0 0 0 0 0 0 0 0]

>>> 0.constant.array([9])
[0 0 0 0 0 0 0 0 0]

>>> [9].constantArray(0)
[0 0 0 0 0 0 0 0 0]

>>> [0].reshape([9])
[0 0 0 0 0 0 0 0 0]

>>> [0].replicate(9)
[0 0 0 0 0 0 0 0 0]

>>> { 0 }.duplicate(9)
[0 0 0 0 0 0 0 0 0]
```

A 3×3 matrix, each place holding its column index minus its row index:

```
>>> { :index |
>>> 	let [i, j] = index;
>>> 	j - i
>>> }.fill([3 3])
[
	 0  1 2;
	-1  0 1;
	-2 -1 0
]

>>> -.swap.array([3 3])
[
	 0  1 2;
	-1  0 1;
	-2 -1 0
]
```

A 3×2 matrix, each place holding the square of its two place _(i,j)_ index:

```
>>> { :i |
>>> 	i * i
>>> }.fill([3 2])
[
	1 1; 1 4:;
	4 1; 4 4:;
	9 1; 9 4
]
```

A constant 3×3 matrix:

```
>>> 0.constant.fill([3 3])
[
	0 0 0;
	0 0 0;
	0 0 0
]

>>> { :i :j | 0 }.array([3 3])
[0 0 0; 0 0 0; 0 0 0]

>>> [3 3].constantArray(0)
[0 0 0; 0 0 0; 0 0 0]

>>> [0].reshape([3 3])
[0 0 0; 0 0 0; 0 0 0]
```

If the shape is empty answer a scalar of _f_ applied to `zero`:

```
>>> { :i |
>>> 	i
>>> }.fill([])
0
```

The vector case more readily be written using `array` or `map` or `table` or `collect`:

```
>>> { :i | i[1].square }.fill([9])
[1 4 9 16 25 36 49 64 81]

>>> square/1.array([9])
[1 4 9 16 25 36 49 64 81]

>>> square/1.map(1:9)
[1 4 9 16 25 36 49 64 81]

>>> square/1.table(1:9)
[1 4 9 16 25 36 49 64 81]

>>> 1:9.collect(square/1)
[1 4 9 16 25 36 49 64 81]
```

* * *

See also: array, atAllPut, constantArray, duplicate, fillFromWith!, replicate, table

Guides: Array Functions, List Functions

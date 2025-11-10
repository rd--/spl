# fill

- _fill(⍴, f:/1)_

Allocate a vector or array of the indicated shape _⍴_, and fill each slot by applying the unary block _f_ to the index.
At `Integer` answers a vector, at `Sequence` answers an array.

List of squares of indices with literal block:

```
>>> 9.fill { :index | index * index }
[1 4 9 16 25 36 49 64 81]
```

List of squares of indices with named method:

```
>>> 9.fill(square:/1)
[1 4 9 16 25 36 49 64 81]
```

List of negated indices:

```
>>> 9.fill(negate:/1)
[-1 -2 -3 -4 -5 -6 -7 -8 -9]
```

Constant list:

```
>>> 9.fill(0.constant)
[0 0 0 0 0 0 0 0 0]
```

A 3×3 matrix, each place holding its column index minus its row index:

```
>>> [3 3].fill { :index |
>>> 	let [i, j] = index;
>>> 	j - i
>>> }
[
	 0  1 2;
	-1  0 1;
	-2 -1 0
]
```

A 3×2 matrix, each place holding the square of its two place _(i,j)_ index:

```
>>> [3 2].fill { :i |
>>> 	i * i
>>> }
[
	1 1;
	1 4
	:;
	4 1;
	4 4
	:;
	9 1;
	9 4
]
```

A constant 3×3 matrix:

```
>>> [3 3].fill(0.constant)
[
	0 0 0;
	0 0 0;
	0 0 0
]
```

If the shape is empty answer a scalar of _f_ applied to `zero`:

```
>>> [].fill { :i |
>>> 	i
>>> }
0
```

* * *

See also: !, atAllPut, fillFromWith

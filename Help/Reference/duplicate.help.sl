# duplicate

- _duplicate(f:/0, ⍴)_

Evaluate _f()_ to fill each place in an array of the indicated shape.

A 2×3 matrix:

```
>>> { 1 }.duplicate([2 3])
[
	1 1 1;
	1 1 1
]
```

A 3×2 matrix:

```
>>> { 0 }.duplicate([3 2])
[
	0 0;
	0 0;
	0 0
]
```

A 3×2×3 array:

```
>>> { 1 }.duplicate([3 2 3])
[
	1 1 1;
	1 1 1
	:;
	1 1 1;
	1 1 1
	:;
	1 1 1;
	1 1 1
]
```

If the shape is empty answer a scalar:

```
>>> { 1 }.duplicate([])
1
```

With external state:

```
>>> let i = 0;
>>> { i := i + 1; i }
>>> .duplicate([3 3])
[
	1 2 3;
	4 5 6;
	7 8 9
]
```

* * *

See also: #, !, List, replicate

Guides: List Functions

Categories: Copying

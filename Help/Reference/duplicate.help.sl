# duplicate

- _f:/0 ! ⍴_

Evaluate the no-argument block _f_ to fill each place in a newly constructed array of the indicated shape _⍴_.

A three-vector:

```
>>> { 1 } ! [3]
[1 1 1]
```

A 2×3 matrix:

```
>>> { 1 } ! [2 3]
[
	1 1 1;
	1 1 1
]

>>> { 1 }.duplicate([2 3])
[
	1 1 1;
	1 1 1
]
```

A 3×2 constant matrix:

```
>>> { 'x' } ! [3 2]
[
	'x' 'x';
	'x' 'x';
	'x' 'x'
]

>>> { 0 }.duplicate([3 2])
[
	0 0;
	0 0;
	0 0
]
```

A 3×2×3 constant array:

```
>>> { 1 } ! [3 2 3]
[
	1 1 1; 1 1 1:;
	1 1 1; 1 1 1:;
	1 1 1; 1 1 1
]

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

If the shape is empty answer a scalar,
which is distinct from a _shape_ value of `one`:

```
>>> { 1 } ! []
1

>>> { 1 }.duplicate([])
1

>>> { 1 } ! 1
[1]
```

With external state:

```
>>> let x = 1;
>>> { x := x * 2; x } ! 5
[2 4 8 16 32]

>>> let i = 0;
>>> { i := i + 1; i }
>>> .duplicate([3 3])
[
	1 2 3;
	4 5 6;
	7 8 9
]

>>> let r = Sfc32(12345);
>>> {
>>> 	r.nextRandomInteger(1, 9)
>>> } ! [5]
[8 5 9 9 4]
```

If ⍴ is an integer is is taken to mean _[⍴]_.

```
>>> { 1 } ! 3
[1 1 1]

>>> let x = Sfc32(6783141);
>>> { x.nextRandomFloat } ! 3
[0.394068 0.704648 0.187997]
```

* * *

See also: #, !, replicate

Guides: List Functions

Categories: Copying

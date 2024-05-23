# outer

- _outer(aBlock:/2)_
- _outer(aBlock:/2, aSequence, anotherSequence)_

Answer the generalized outer product of two sequences,
passing all combinations of the elements in each to _aBlock_.

Concatenate strings:

```
>>> ['a' 'b'] ++.outer ['x' 'y' 'z']
['ax' 'ay' 'az'; 'bx' 'by' 'bz']

>>> ['a' 'b' 'c'] ++.outer ['x' 'y']
['ax' 'ay'; 'bx' 'by'; 'cx' 'cy']

>>> ['1' '2' '3' '4'] ++.outer ['a' 'b' 'c']
['1a' '1b' '1c'; '2a' '2b' '2c'; '3a' '3b' '3c'; '4a' '4b' '4c']

>>> { :i :j | 10 * i + j }.outer(1:4, 1:3)
[11 12 13; 21 22 23; 31 32 33; 41 42 43]
```

Compare elements with each other using equal:

```
>>> let x = [1 2 3 2];
>>> (x =.outer x).boole
[1 0 0 0; 0 1 0 1; 0 0 1 0; 0 1 0 1]
```

A multiplication table:

```
>>> let x = [1 .. 5];
>>> x *.outer x
[1 2 3 4 5; 2 4 6 8 10; 3 6 9 12 15; 4 8 12 16 20; 5 10 15 20 25]
```

Lower-triangular matrix:

```
>>> (1:5 >.outer 1:5).boole
[0 0 0 0 0; 1 0 0 0 0; 1 1 0 0 0; 1 1 1 0 0; 1 1 1 1 0]
```

Apply a function on a tensor product grid:

```
>>> let x = [0, 0.1, 0.25, 0.5, 1];
>>> let y = [-1, -0.5, 0, 1 / 3, 2 / 3, 1];
>>> { :x :y | (pi * (x ^ 2) * y).sin }.outer(x, y).first(3)
[-0 -0 0 0 0 0; -0.03141 -0.015707 0 0.010472 0.020942 0.031411; -0.19509 -0.09802 0 0.06540 0.13053 0.19509]
```

Outer product of matrices:

```
>>> *.outer([3 5; 7 9], [1 2 3; 4 5 6; 7 8 9])
[
	[
		[ 3 6  9; 12 15 18; 21 24 27],
		[5 10 15; 20 25 30; 35 40 45]
	],
	[
		[7 14 21; 28 35 42; 49 56 63],
		[9 18 27; 36 45 54; 63 72 81]
	]
]

* * *

See also: inner, outerProduct

References:
_Apl_
[1](https://aplwiki.com/wiki/Outer_Product),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/slash#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianProduct.html)
[2](https://mathworld.wolfram.com/VectorSpaceTensorProduct.html)
[3](https://reference.wolfram.com/language/ref/Outer.html)
[4](https://reference.wolfram.com/language/ref/Table.html)

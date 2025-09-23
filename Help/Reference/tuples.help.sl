# tuples

- _tuples([x₁ x₂ …], n)_
- _tuples([x₁ x₂ …; y₁ y₂ …])_

In the binary case,
answer all of the possible _n_-tuples of each of the elements of the sequence _x_,
which is an _n_-element sequence of any sized sequences.

In the unary case,
answer of all possible tuples whose _i_-th element is from _i_-th _l_.

`tuples` of a 2×2 matrix is a 4×2 matrix:

```
>>> [1 2; 3 4].tuples
[1 3; 1 4; 2 3; 2 4]

>>> [3 4; 1 2].tuples
[3 1; 3 2; 4 1; 4 2]
```

`tuples` of a two-vector and a three-vector is a 6×2 matrix:

```
>>> [1 2; 7 8 9].tuples
[1 7; 1 8; 1 9; 2 7; 2 8; 2 9]

>>> [1 2 3; 1 2].tuples
[1 1; 1 2; 2 1; 2 2; 3 1; 3 2]
```

`tuples` of a three-vector and a four-vector is a 12×2 matrix:

```
>>> [0:2, 0:3].tuples
[
	0 0; 0 1; 0 2; 0 3;
	1 0; 1 1; 1 2; 1 3;
	2 0; 2 1; 2 2; 2 3
]
```

`tuples` of a two-vector, a three-vector, and a two-vector is a 12×3 matrix:

```
>>> let m = [
>>> 	'a' 'b';
>>> 	'x' 'y' 'z';
>>> 	'u' 'v'
>>> ].tuples;
>>> (m.shape, m.collect(stringJoin:/1))
(
	[12 3],
	[
		'axu' 'axv' 'ayu' 'ayv' 'azu' 'azv'
		'bxu' 'bxv' 'byu' 'byv' 'bzu' 'bzv'
	]
)
```

Two-tuples are the cartesian product of a set with itself:

```
>>> let x = [0 1 2];
>>> let a = x.tuples(2);
>>> let b = [x, x].tuples;
>>> let c = x.cartesianProduct(x);
>>> (a, a = b, b = c)
(
	[
		0 0; 0 1; 0 2;
		1 0; 1 1; 1 2;
		2 0; 2 1; 2 2
	],
	true,
	true
)
```

The Cartesian product of an empty list with any other list is the empty list:

```
>>> [[1, 2], []].tuples
[]

>>> [[], [1, 2]].tuples
[]
```

The number of tuples is the product of the size of each sequence:

```
>>> [0 1 2 3; 4 5 6 7 8 9].tuples.size
(4 * 6)

>>> [0 1; 2 3; 4 5; 6 7 8 9].tuples.size
(2 * 2 * 2 * 4)
```

Word combinations:

```
>>> [
>>> 	'' 're' 'un';
>>> 	'wind';
>>> 	'' 'ing' 's'
>>> ].tuples.collect(stringJoin:/1)
[
	'wind' 'winding' 'winds'
	'rewind' 'rewinding' 'rewinds'
	'unwind' 'unwinding' 'unwinds'
]

>>> [
>>> 	'' '-';
>>> 	'1';
>>> 	'J';
>>> 	'' '-';
>>> 	'1'
>>> ].tuples.collect(stringJoin:/1)
['1J1' '1J-1' '-1J1' '-1J-1']
```

All possible one, two and three-tuples of 0 and 1,
digits of successive base-two numbers:

```
>>> ([0 1].tuples(1), 2 ^ 1)
([0; 1], 2)

>>> ([0 1].tuples(2), 2 ^ 2)
([0 0; 0 1; 1 0; 1 1], 4)

>>> ([0 1].tuples(3), 2 ^ 3)
(
	[
		0 0 0; 0 0 1; 0 1 0; 0 1 1;
		1 0 0; 1 0 1; 1 1 0; 1 1 1
	],
	8
)
```

The first nine three-tuples of the base-three counting system:

```
>>> [0 1 2].tuples(3).first(9)
[
	0 0 0; 0 0 1; 0 0 2;
	0 1 0; 0 1 1; 0 1 2;
	0 2 0; 0 2 1; 0 2 2
]
```

The first element given is always picked first:

```
>>> [1 0].tuples(2)
[1 1; 1 0; 0 1; 0 0]

>>> [1 0].tuples(3)
[0 1].tuples(3).reverse
```

All ways of picking one element from each list:

```
>>> ['a' 'b'; 1 2 3 4; 'x'].tuples
[
	'a' 1 'x'; 'a' 2 'x'; 'a' 3 'x'; 'a' 4 'x';
	'b' 1 'x'; 'b' 2 'x'; 'b' 3 'x'; 'b' 4 'x'
]
```

Each occurrence of an element is picked separately:

```
>>> [1 2].tuples(2)
[1 1; 1 2; 2 1; 2 2]

>>> [1 1 2].tuples(2)
[1 1; 1 1; 1 2; 1 1; 1 1; 1 2; 2 1; 2 1; 2 2]
```

All possible trigrams of A and B:

```
>>> ['A' 'B'].tuples(3).collect(stringJoin:/1)
[
	'AAA' 'AAB' 'ABA' 'ABB'
	'BAA' 'BAB' 'BBA' 'BBB'
]
```

* * *

See also: cartesianProduct, powerSet, subsets, table, tuplesArray, tuplesCollect, tuplesDo

Guides: Combinatorial Functions, List Functions, Set Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/curlylf),
_Mathematica_
[1](https://mathworld.wolfram.com/String.html)
[2](https://reference.wolfram.com/language/ref/Tuples.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/combinations.html)

Categories: Combinatorics, Enumerating, Math

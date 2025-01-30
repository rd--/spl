# atAll

- _atAll(aCollection, indices)_
- _atAll(c, i, j)_
- _atAll(c, i, j, k)_

In the binary case,
answer a new collection like _aCollection_ containing all elements at _indices_.

In the ternary case _c_ is a collection, _i_ the primary indices, and _j_ the secondary indices.
In the quaternary case _k_ are tertiary indices.

At `List`:

```
>>> ['1' '2' '3' '4'].atAll([3 2 4])
['3' '2' '4']
```

At a square 5×5 `List` matrix,
using secondary indices,
select the second and fourth entries of the first, third and fifth rows:

```
>>> [5 5].iota.atAll([1 3 5], [2 4])
[
	 2  4;
	12 14;
	22 24
]
```

Select the last two columns of a 4×4 matrix:

```
>>> [4 4].iota.atAll(1:4, 3:4)
[
	 3  4;
	 7  8;
	11 12;
	15 16
]
```

Select the third column of a 5×5 matrix:

```
>>> [5 4].iota.atAll(1:5, [3])
[3; 7; 11; 15; 19]
```

Answer the first and fifth column entries of the second and fourth rows of the first and third pages of a 3×4×5 array:

```
>>> [3 4 5].iota.atAll([1 3], [2 4], [1 5])
[
	6 10; 16 20:;
	46 50; 56 60
]
```

Answer the second column of the third and fourth pages of a 5×4×3 array:

```
>>> [5 4 3].iota.atAll(3:4, 1:4, 2:2)
[
	26; 29; 32; 35:;
	38; 41; 44; 47
]
```

At `String`:

```
>>> 'abcde'.atAll([2 4 1 3 5])
'bdace'
```

At `Record`, the order of the keys is not defined:

```
>>> (x: 1, y: 2, z: 3).atAll(['z' 'x'])
(x: 1, z: 3)
```

The infix form of the binary `atAll` is `@*`:

```
>>> ['1' '2' '3' '4'] @* [3 2 4]
['3' '2' '4']

>>> (x: 1, y: 2, z: 3) @* ['x' 'z']
(x: 1, z: 3)
```

* * *

See also: at, atAllBlend, atAllPin, atAllPut, atPath

Guides: AtAll Syntax

References:
_Apl_
[1](https://aplwiki.com/wiki/From),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/curlylf#dyadic)

Categories: Accessing

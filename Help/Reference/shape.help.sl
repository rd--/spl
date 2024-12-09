# shape

- _shape(aSequence | aMatrix | anObject)_

Answer the shape of the argument, a vector of lengths of the array along each axis.

The shape of a _scalar_ is the empty list:

```
>>> 1.shape
[]
```

The shape of a _vector_ is a one element list:

```
>>> 1:5.shape
[5]
```

The shape of a _matrix_ is a two element list,
telling the number of rows and columns:

```
>>> [
>>> 	1 2;
>>> 	3 4;
>>> 	5 6
>>> ].shape
[3 2]

>>> [
>>> 	1 2 3;
>>> 	4 5 6
>>> ].shape
[2 3]

>>> [[1]].shape
[1 1]
```

The shape of a _volume_ is a three element list:

```
>>> [
>>> 	1 2;
>>> 	3 4
>>> 	:;
>>> 	5 6;
>>> 	7 8
>>> ].shape
[2 2 2]

>>> [
>>> 	1;
>>> 	2;
>>> 	3
>>> 	:;
>>> 	4;
>>> 	5;
>>> 	6
>>> ].shape
[2 3 1]

>>> [
>>> 	1 2;
>>> 	3 4;
>>> 	5 6
>>> 	:;
>>> 	7 8;
>>> 	9 10;
>>> 	11 12
>>> ].shape
[2 3 2]

>>> [
>>> 	[
>>> 		1 2;
>>> 		3 4;
>>> 		5 6
>>> 	]
>>> ].shape
[1 3 2]

>>> [[[1]]].shape
[1 1 1]
```

Irregular arrays do not have a shape:

```
>>> { [1; 2 3].shape }.ifError { true }
true

>>> [1; 2 3].isArray
false
```

Find the dimensions of a matrix:

```
>>> [1 2 3; 4 5 6].shape
[2 3]
```

Works with arrays of any depth:

```
>>> [[[[1, 2]]]].shape
[1 1 1 2]
```

The empty sequence has shape [0]:

```
>>> [].shape
[0]
```

A row vector:

```
>>> [[1 2 3 4 5]].shape
[1 5]
```

A column vector:

```
>>> [1; 2; 3; 4; 5].shape
[5 1]
```

Where supported `shape` is displayed as ⍴.

* * *

See also: iota, isArray, isMatrix, isSequence, isVector, numberOfRows, numberOfColumns, rank, reshape, shapeIndices

References:
_Apl_
[1](https://aplwiki.com/wiki/Shape),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/dollar),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Dimensions.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/size.html)

Unicode: U+2374 ⍴ Apl Functional Symbol Rho

Categories: Math, Array

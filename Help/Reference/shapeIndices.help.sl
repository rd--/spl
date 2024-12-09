# shapeIndices

- _shapeIndices(aSequence)_

Enumerate all of the indices given by the shape indicated at _aSequence_.

Indices are `List`s, if the shape indicates a vector the indices are lists of one place.

```
>>> [3].shapeIndices
[1; 2; 3]
```

Matrix indices:

```
>>> [3 2].shapeIndices
[
	1 1; 1 2;
	2 1; 2 2;
	3 1; 3 2
]
```

Volume indices:

```
>>> [2 2 2].shapeIndices
[
	1 1 1; 1 1 2; 1 2 1; 1 2 2;
	2 1 1; 2 1 2; 2 2 1; 2 2 2
]
```

`atPath` and `@>` index using lists:

```
>>> let a = [1 2; 3 4:; 5 6; 7 8];
>>> let s = a.shape;
>>> (
>>> 	s,
>>> 	s.shapeIndices.collect { :each |
>>> 		a @> each
>>> 	}
>>> )
([2 2 2], [1 2 3 4 5 6 7 8])
```

* * *

See also: @>, atPath, deepIndices, reshape, shape, shapeIndicesDo

Categories: Accessing, Indexing

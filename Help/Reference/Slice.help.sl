# Slice

- _Slice([x₁ x₂ …], i, n)_

A `Slice` is a `Type` holding a view into a segment of the sequence _x_,
starting at start index _i_,
and continuing for _n_ places.

`Slice` does not copy the elements from _x_ into separate storage.

Traits implemented by `Slice`:

```
>>> system.typeLookup('Slice')
>>> .traitNameList
[
	'Object'
	'Copyable'
	'Equatable'
	'Comparable'
	'Iterable'
	'Indexable'
	'Collection'
	'Sequenceable'
]
```

`sliceFromTo` constructs a `Slice` from a `Sequence`:

```
>>> let a = [1 .. 9] ++ [9 .. 1];
>>> let b = a.sliceFromTo(7, 13);
>>> (
>>> 	a.size, a.indices, a.sum,
>>> 	b.size, b.indices, b.asList,
>>> 	b.first, b.last, b.sum
>>> )
(
	18, 1:18, 90,
	7, 1:7, [7 8 9 9 8 7 6],
	7, 6, 54
)
```

A `Slice` is a sequence,
hence one can take a `Slice` of a `Slice`,
this process does not create a double indirection:

```
>>> let p = [111 .. 999];
>>> let q = p.sliceFromTo(333, 777);
>>> let r = q.sliceFromTo(222, 444);
>>> (
>>> 	[p.first, p.last, p.size],
>>> 	[q.first, q.last, q.size],
>>> 	[r.first, r.last, r.size],
>>> 	q.contents == p,
>>> 	r.contents == q.contents
>>> )
(
	[111 999 889],
	[443 887 445],
	[664 886 223],
	true,
	true
)

>>> 111:999.copyFromTo(333, 777)
443:887

>>> 443:887.copyFromTo(222, 444)
664:886
```

`Slice` does not compare `=` to a `List`,
use `hasEqualElements` to compare sequences regardless of type:

```
>>> let x = [1 2 3 4 5];
>>> let y = Slice(x, 2, 2);
>>> let z = [2 3];
>>> (y = z, y.hasEqualElements(z))
(false, true)
```

* * *

See also: copyFromTo, Sequence, sliceFromTo

Guides: List Functions

Categories: Collection, Type

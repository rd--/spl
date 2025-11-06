# ListView

- _ListView([x₁ x₂ …], i, j, k=1)_

A `ListView` is a `Type` holding a view into a segment of the sequence _x_,
starting at start index _i_,
and continuing to end index _j_.
The reference index for the view is _k_, ordinarily `one`.

`ListView` does not copy the elements from _x_ into separate storage.

Traits implemented by `ListView`:

```
>>> system.typeLookup('ListView')
>>> .traitNameList
[
	'Object'
	'Equatable'
	'Comparable'
	'Iterable'
	'Indexable'
	'Collection'
	'Sequenceable'
]
```

Constructs a `ListView` from a `List`:

```
>>> let a = [1 .. 9] ++ [9, 8 .. 1];
>>> let b = ListView(a, 7, 13, 1);
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

A `ListView` is a sequence,
hence one can take a `ListView` of a `ListView`,
this process does not create a double indirection:

```
>>> let p = [111 .. 999];
>>> let q = ListView(p, 333, 777, 1);
>>> let r = ListView(q, 222, 444, 1);
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

`ListView` does not compare `=` to a `List`,
use `hasEqualElements` to compare sequences regardless of type:

```
>>> let x = [1 2 3 4 5];
>>> let y = ListView(x, 2, 3, 1);
>>> let z = [2 3];
>>> (y = z, y.hasEqualElements(z))
(false, true)
```

The reference index allows fo creating a zero indexed view onto a list:

```
>>> let a = [1 2 3 4 5];
>>> let b = ListView(a, 1, 5, 0);
>>> (b.indices, b[1], b[4], b[0])
(0:4, 2, 5, 1)
```

Answer a `ListView` of the sequence _u_ from start index _i_ to end index _j_,
inclusive of each index:

```
>>> let l = [1 3 2 4 6 5];
>>> let v = ListView(l, 3, 5, 1);
>>> (v.size, v.asList)
(3, [2 4 6])
```

The `average` and `median`, `min`, `max` and `sum` of a list view:

```
>>> let a = [1 3 2 4 6 5];
>>> let b = ListView(a, 3, 5, 1);
>>> (
>>> 	b.average,
>>> 	b.median,
>>> 	b.min,
>>> 	b.max,
>>> 	b.sum
>>> )
(4, 4, 2, 6, 12)
```

* * *

See also: copyFromTo, List

Guides: List Functions

Categories: Collection, Type

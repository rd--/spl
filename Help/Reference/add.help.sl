# add!

- _add!(c, x)_

Include the object _x_ as one of the elements of the collection _c_ in-place.
After adding an entry, the `size` of the collection increases by one.
Therefore, for collections with invariants such as `Dictionary` and `IdentitySet`, `add` may fail.
In these cases see `include`, which is like `add` except that the size of the collection may stay the same.
Answers _x_.

At `Multiset`:

```
>>> let b = Multiset([], ==);
>>> b.add!('x');
>>> (b.add!('y'), b.size, b.List)
('y', 2, ['x' 'y'])
```

At `List`, add to end of list, see also `addFirst` and `addLast`:

```
>>> let l = [];
>>> l.add!('x');
>>> (l.add!('y'), l.size, l)
('y', 2, ['x' 'y'])
```

At `Map`:

```
>>> let m = Map();
>>> m.add!('x' -> 1);
>>> (
>>> 	m.add!('y' -> 2),
>>> 	m.size,
>>> 	m.Record
>>> )
('y' -> 2, 2, (x: 1, y: 2))
```

At `Record`:

```
>>> let r = Record();
>>> r.add!('x' -> 1);
>>> (r.add!('y' -> 2), r.size, r)
('y' -> 2, 2, (x: 1, y: 2))
```

It is an `error` if the key exists:

```
>>> {
>>> 	(x: 1).add!('x' -> 2)
>>> }.hasError
true
```

At `Set`,
`add` will include _x_ as one of the set elements only if not already present:

```
>>> let s = Set([], ==);
>>> s.add!('x');
>>> (s.add!('y'), s.size, s.List)
('y', 2, ['x' 'y'])

>>> Set([2 3], =).add!(1)
1

>>> {
>>> 	Set[1 2 3].add!(1)
>>> }.hasError
true
```

At `SortedList`:

```
>>> let l = [5 1 6 4].SortedList;
>>> l.add!(2);
>>> l.addAll!([3 7]);
>>> l
SortedList[1 2 3 4 5 6 7]
```

At `String`, which is not extensible:

```
>>> { 'string'.add!('?') }.hasError
true
```

* * *

See also: Add, addAll!, addFirst!, addLast!, include!, remove!

Guides: Dictionary Functions, List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AppendTo.html),
_Smalltalk_
5.7.5.1

Categories: Adding

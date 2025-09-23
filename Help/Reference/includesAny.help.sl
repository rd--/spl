# includesAny

- _includesAny(c₁, c₂)_

Answer whether any elements of the collection _c₂_ are elements of the collection _c₁_.

At `Range`:

```
>>> 3:5.includesAny(5:7)
true

>>> 3:5.includesAny(9:11)
false
```

The first list contains some of the elements of the second list:

```
>>> [2 1 2].includesAny([1 2 3])
true
```

The first list does not contain any of the elements of the second list:

```
>>> [4 5 6].includesAny([1 2 3])
false
```

At `Record` consider values:

```
>>> (x: 1, y: 2, z: 3).includesAny([2 4 6])
true
```

Equivalent to testing for nonempty intersection of the lists:

```
>>> let a = [5 8 8 3];
>>> let b = [9 10 7 2];
>>> (
>>> 	a.includesAny(b),
>>> 	a.intersection(b) != [],
>>> 	a.isIntersecting(b)
>>> )
(false, false, false)
```

At empty set:

```
>>> [1 2].includesAny([])
false

>>> [].includesAny([])
false
```

* * *

See also: includes, includesAll, intersection, isIntersecting

Guides: List Functions, Set Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ContainsAny.html)

Categories: Testing

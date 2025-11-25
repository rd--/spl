# hasEqualElements

- _hasEqualElements(c₁, c₂, f:/2)_

Answer `true` if the collections _c₁_ and _c₂_,
which must be either dictionaries or sequences,
have the same size,
and if each of the elements of _c₁_ are equal the corresponding element of _c₂_,
according to the equality block _f_.

A `Map` and a `Record` are never equal but may have equal elements:

```
>>> let a = (x: 1, y: 2);
>>> let b = [|'y' -> 2, 'x' -> 1|];
>>> (a = b, a.hasEqualElements(b, =))
(false, true)
```

At `List`, requires elements be equal in sequence:

```
>>> [1 2 3].hasEqualElements([3 2 1])
false
```

A `Range` and a `List` are never equal, but may have equal elements:

```
>>> 1:9 = [1 .. 9]
false

>>> 1:9.hasEqualElements([1 .. 9])
true

>>> [3 2 1].hasEqualElements(3:1:-1)
true
```

A `Range` and a `List` are never identical, but may have identical elements:

```
>>> 1:9.hasEqualElements([1 .. 9], ==)
true
```

Two distinct `List` objects are never identical, but may have identical elements:

```
>>> let p = [1 .. 9];
>>> let q = [1 .. 9];
>>> (
>>> 	p == q,
>>> 	p.hasEqualElements(q, ==)
>>> )
(false, true)
```

* * *

See also: =, ==, hasEqualSlots

Guides: Equality Functions

Categories: Comparing

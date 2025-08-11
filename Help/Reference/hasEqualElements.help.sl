# hasEqualElements

- _hasEqualElements(c₁, c₂)_

Answer `true` if the collections _c₁_ and _c₂_ have the same size,
and if each of the elements of _c₁_ are equal the corresponding element of _c₂_.

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
```

* * *

See also: =, ==, hasEqualElementsBy, hasEqualSlots

Categories: Comparing

# hasEqualElements

- _hasEqualElements(aCollection, anotherCollection)_

Answer `true` if _aCollection_ and _anotherCollection_ have the same size,
and if each of the elements of _aCollection_ equal the corresponding element of _anotherCollection_.

A `Range` and a `List` are never equal, but may have equal elements:

```
>>> 1:9.hasEqualElements([1 .. 9])
true
```

* * *

See also: =, ==, hasEqualElementsBy, hasEqualSlots

Categories: Comparing

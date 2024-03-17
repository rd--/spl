# hasEqualElementsBy

- _hasEqualElementsBy(aCollection, anotherCollection, aBlock:/2)_

Answer `true` if _aCollection_ and _anotherCollection_ have the same size,
and if each of the elements of _aCollection_ answer `true` to _aBlock_ given the corresponding element of _anotherCollection_.

A `Range` and a `List` are never identical, but may have identical elements:

```
>>> 1:9.hasEqualElementsBy([1 .. 9], ==)
true
```

Two distinct `List` objects are never identical, but may have identical elements:

```
>>> let p = [1 .. 9];
>>> let q = [1 .. 9];
>>> (p == q, p.hasEqualElementsBy(q, ==))
(false, true)
```

* * *

See also: =, ==

Categories: Comparing

# remove

- _remove(aCollection, oldObject)_

Remove _oldObject_ from the elements of _aCollection_.
Answer _oldObject_ unless no element is equal to _oldObject_, in which case, raise an error.

At `List`:

```
>>> let list = [1 .. 5];
>>> (list.remove(3), list)
(3, [1 2 4 5])
```

Remove only one matching element:

```
>>> let list = [1 2 3 2 1];
>>> (list.remove(2), list)
(2, [1 3 2 1])
```

At `Set`:

```
>>> let s = [1 2 3].asSet(~);
>>> let z = s.remove(1.00001);
>>> (s.asList, z)
([2 3], 1)
```

If no item matches an `error` is signaled:

```
>>> { [1 2 3].remove(4) }.ifError { true }
true

>>> {
>>> 	[1 2 3].asSet(=).remove(4)
>>> }.ifError { true }
true
```

* * *

See also: add, Removeable, removeAll, removeAllSuchThat, removeAt, removeKey, removeKeyIfAbsent, without

References:
_Smalltalk_
5.7.5.3

Categories: Removing

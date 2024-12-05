# remove

- _remove(aCollection, oldObject)_

Remove _oldObject_ from the elements of _aCollection_.
Answer _oldObject_ unless no element is equal to _oldObject_, in which case, raise an error.

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

* * *

See also: add, Removeable, removeAll, removeAt, removeKey, removeKeyIfAbsent

References:
_Smalltalk_
5.7.5.3

Categories: Removing

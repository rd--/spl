# removeKeyIfAbsent

- _removeKeyIfAbsent(aDictionary, key, aBlock:/0)_

Remove the element which is stored at _key_ in _aDictionary_.
Answer the removed element.

```
>>> let r = (x: 1, z: 3);
>>> let z = r.removeKeyIfAbsent('z') {
>>> 	nil
>>> };
>>> (z, r)
(3, (x: 1))
```

If no such key exists answer _aBlock()_.

```
>>> let r = (x: 1, z: 3);
>>> r.removeKeyIfAbsent('y') {
>>> 	true
>>> }
true
```

* * *

See also: remove, removeAllKeys, removeAt, removeKey

References:
_Smalltalk_
5.7.2.17

Categories: Removing

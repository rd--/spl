# removeKey

- _removeKey(aDictionary, key)_

Remove the element which is stored at _key_ in _aDictionary_.
Answer the removed element.

```
>>> let d = (x: 1, y: 2, z:3);
>>> (d.removeKey('y'), d)
(2, (x: 1, z: 3))
```

If the key does not exist it is an `error`:

```
>>> {
>>> 	(x: 1, y: 2).removeKey('w')
>>> }.ifError { true }
true
```

* * *

See also: remove, removeAllKeys, removeAt, removeKeyIfAbsent

References:
_Smalltalk_
5.7.2.16

Categories: Removing

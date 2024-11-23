# removeKeyIfAbsent

- _removeKeyIfAbsent(aDictionary, key, aBlock:/0)_

Remove the element which is stored at _key_ in _aDictionary_.
Answer the removed element.
If no such key exists answer _aBlock()_.

```
>>> (x: 1, z:3).removeKeyIfAbsent('y') { true }
true
```

* * *

See also: remove, removeAllKeys, removeKey

References:
_Smalltalk_
5.7.2.17

Categories: Removing

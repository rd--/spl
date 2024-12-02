# addAfter

- _addAfter(aSequence, newObject, oldObject)_

Add _newObject_ as an element of _aSequence_.
Put it in the sequence just succeeding _oldObject_.
Answer _newObject_.

```
>>> let l = [1 2 4];
>>> let r = l.addAfter(3, 2);
>>> (r, l)
(3, [1 2 3 4])
```

* * *

See also: add, addAfterIndex, addBefore, insertAt

References:
_Smalltalk_
5.7.18.2

Categories: Adding

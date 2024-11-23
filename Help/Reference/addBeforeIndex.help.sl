# addBeforeIndex

- _addBeforeIndex(aSequence, newObject, index)_

Add _newObject_ as an element of _aSequence_.
Put it in the sequence just before _index_.
Answer _newObject_.

```
>>> let l = [1 2 3 4 6];
>>> l.addBeforeIndex(0, 1);
>>> l.addBeforeIndex(5, 6);
>>> l
[0 1 2 3 4 5 6]
```

Add before first and after last:

```
>>> let l = ['x' 'y'];
>>> l.addBeforeIndex('w', 1);
>>> l.addBeforeIndex('z', 4);
>>> l
['w' 'x' 'y' 'z']
```

* * *

See also: add, addBefore, addBefore

References:
_Smalltalk_
5.7.18.5

Categories: Adding

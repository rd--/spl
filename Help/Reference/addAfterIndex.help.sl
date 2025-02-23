# addAfterIndex

- _addAfterIndex(aSequence, newObject, index)_

Add _newObject_ as an element of _aSequence_.
Put it in the sequence just after _index_.
Answer _newObject_.

```
>>> let l = ['w' 'x' 'z'];
>>> let r = l.addAfterIndex('y', 2);
>>> (r, l)
('y', ['w' 'x' 'y' 'z'])
```

To add to the start of a `List` specify the index to be `zero`:

```
>>> let l = [2 3 4];
>>> (l.addAfterIndex(1, 0), l)
(1, [1 2 3 4])
* * *

To add to the end of a `List` specify the index to be the `size` of the list:

```
>>> let l = [1 2 3];
>>> (l.addAfterIndex(4, 3), l)
(4, [1 2 3 4])
* * *

See also: add, addAfter, addBefore, insertAt

References:
_Smalltalk_
5.7.18.3

Categories: Adding

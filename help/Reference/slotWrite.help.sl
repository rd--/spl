# slotWrite

- _slotWrite(anObject, aString, anotherObject)_

Set the value of the slot _aString_ at _anObject_ to have the value _anotherObject_.

```
>>> ('x' -> 1).slotNameList
['key' 'value']

>>> let a = ('x' -> 1);
>>> a.slotWrite('key', 'y');
>>> a.slotWrite('value', 2);
>>> a
'y' -> 2
```

* * *

See also: slotNameList, slotRead

Categories: Reflection

Status: Experimental

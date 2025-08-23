# slotWrite

- _slotWrite(x, s, y)_

Set the value of the slot named _s_ at the object _x_ to have the value _y_.

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

Guides: Reflection Functions

Categories: Reflection

Status: Experimental

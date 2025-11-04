# uncheckedSlotWrite

- _uncheckedSlotWrite(x, s, y)_

Set the value of the slot named _s_ at the object _x_ to have the value _y_.

```
>>> ('x' -> 1).slotNameList
['key' 'value']

>>> let a = ('x' -> 1);
>>> a.uncheckedSlotWrite('key', 'y');
>>> a.uncheckedSlotWrite('value', 2);
>>> a
'y' -> 2
```

* * *

See also: slotNameList, uncheckedSlotRead

Guides: Reflection Functions

Categories: Reflection

Status: Experimental

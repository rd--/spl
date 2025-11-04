# uncheckedSlotRead

- _uncheckedSlotRead(x, s)_

Answer the value of the slot named _s_ at the object _x_,
or `nil` if no such slot exists.

```
>>> ('x' -> 1).slotNameList
['key' 'value']

>>> let a = ('x' -> 1);
>>> (
>>> 	a.uncheckedSlotRead('key'),
>>> 	a.uncheckedSlotRead('value')
>>> )
('x', 1)
```

Answer `nil` for unknown slot:

```
>>> ('x' -> 1)
>>> .uncheckedSlotRead(
>>> 	'unknownSlot'
>>> )
nil
```

* * *

See also: slotList, slotNameList, slotValueList, uncheckedSlotWrite

Guides: Reflection Functions

Categories: Reflection

Status: Experimental

# slotRead

- _slotRead(anObject, aString)_

Answer the value of the slot _aString_ at _anObject_,
or `nil` if no such slot exists.

```
>>> ('x' -> 1).slotNameList
['key' 'value']

>>> let a = ('x' -> 1);
>>> (a.slotRead('key'), a.slotRead('value'))
('x', 1)

>>> ('x' -> 1).slotRead('unknownSlot')
nil
```

* * *

See also: slotNameList, slotWrite

Categories: Reflection

Status: Experimental

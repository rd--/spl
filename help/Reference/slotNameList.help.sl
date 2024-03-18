# slotNameList

- _slotNameList(anObject | aType)_

Answer a `List` of `String`s giving the slot names for the type of _anObject_.

```
>>> 2/3.slotNameList
['numerator' 'denominator']
```

These slots can be read using `slotList` or `slotValueList`.

_Experimental_:
There is an experimental slot reader syntax (:@) and writer syntax (:@ :=).

* * *

See also: perform, Slot Access Syntax, slotList, slotRead, slotValueList, slotWrite

Categories: Accessing, Reflection

Status: Experimental

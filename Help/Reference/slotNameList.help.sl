# slotNameList

- _slotNameList(x)_

Answer a `List` of `String`s giving the slot names for the type of the object _x_.

At `Fraction`:

```
>>> 2/3.slotNameList
['numerator' 'denominator']
```

At `Complex`:

```
>>> 2J3.slotNameList
['real' 'imaginary']
```

These slots can be read using `slotList` or `slotValueList`.

_Experimental_:
There is an experimental slot reader syntax (:@) and writer syntax (:@ :=).

* * *

See also: perform, slotList, slotValueList, uncheckedSlotRead, uncheckedSlotWrite

Guides: Reflection Functions, Slot Access Syntax

Categories: Accessing, Reflection

Status: Experimental

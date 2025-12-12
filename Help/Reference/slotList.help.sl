# slotList

- _slotList(x)_

Answer an association list giving the name and value of each slot at the object _x_.

At `Fraction`:

```
>>> 2/3.slotList
[
	'numerator' -> 2,
	'denominator' -> 3
]
```

At `Record`:

```
>>> (x: 2, y: 3).slotList
[]

>>> (x: 2, y: 3).pseudoSlotList
['size' -> 2]
```

* * *

See also: Association, equalByAtNamedSlots, List, slotNameList

Guides: Reflection Functions

Categories: Reflection

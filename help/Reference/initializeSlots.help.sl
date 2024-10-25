# initializeSlots

- _initializeSlots(anObject, firstSlot...)_

The system generates an _initializeSlots_ method for each declared `Type` with as many arguments as the type has slots.
The method sets the slots of _anObject_ to the provided values, and answer _anObject_.

```
>>> let i = 1 -- 9;
>>> let t = i.typeDefinition;
>>> (t.name, t.slotNameList, i.initializeSlots(3, 7))
('Interval', ['min' 'max'], 3 -- 7)
```

This method,
along with the _new type_ method implemented at `Void` for each `Type`,
provide the instantation mechanism for objects:

```
>>> newInterval().initializeSlots(1, 9)
1 -- 9
```

It is, in effect, a shorthand for setting each slot individually:

```
>>> let i = newInterval();
>>> i.min := 3;
>>> i.max := 7;
>>> i
3 -- 7
```

* * *

See also: initialize, new, Type

Categories: Instance Creation, Reflection

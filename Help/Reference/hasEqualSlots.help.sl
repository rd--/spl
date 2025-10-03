# hasEqualSlots

- _hasEqualSlots(x₁, x₂, f:/2)_

Answer `true` if the objects _x₁_ and _x₂_ have the same `Type`,
and if each of the slots of _x₁_ equal the corresponding slot of _x₂_,
according to the equality block _f_.

```
>>> 2/3.hasEqualSlots(2/3, =)
true
```

The block _f_ may be elided,
in which case it is `=`.

```
>>> 2/3.hasEqualSlots(2/3)
true
```

_Note_: This is a reflective implementation of equality and may be slower than a direct implementation.

* * *

See also: =, ==, equalByAtNamedSlots, hasEqualElements, slotList

Guides: Reflection Functions

Categories: Comparing, Reflection

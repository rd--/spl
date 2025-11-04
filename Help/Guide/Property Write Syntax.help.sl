# Property Write Syntax

Rewrite rule:

- _r::p := x_ ⟹ _uncheckedSlotWrite(r, 'p', x)_

```
>> 'r::p := x'.splSimplify
uncheckedSlotWrite(r, 'p', x)
```

_r::p := x_ sets the value of the property _'p'_ at the record _r_ to the value _x_.

```
>>> let d = (w: (x: (y: (z: 1))));
>>> d::w::x::y::z := -1;
>>> d
(w: (x: (y: (z: -1))))
```

Where supported `::` is displayed as ·.

* * *

See also: At Syntax, AtPut Syntax, Property Read Syntax, Property Syntax

Unicode: U+00B7 · Middle Dot

Categories: Syntax

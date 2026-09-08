# Property Write Syntax

- _r::p := x_

_r::p := x_ sets the value of the property _'p'_ at the record _r_ to the value _x_.

Rewrite rule:

```
>> 'c::p := x'.splSimplify
uncheckedSlotWrite(c, 'p', x)
```

At nested `Record`:

```
>>> let c = (w: (x: (y: (z: 1))));
>>> c::w::x::y::z := -1;
>>> c
(w: (x: (y: (z: -1))))
```

Where supported `::` is displayed as ·.

* * *

See also: At Syntax, AtPut Syntax, Property Read Syntax, Property Syntax

Unicode: U+00B7 · Middle Dot

Categories: Syntax

# Property Read Syntax

- _c::p_

_c::p_ reads the value at the property _'p'_ from the record _c_.

Rewrite rule:

```
>> 'c::p'.splSimplify
uncheckedSlotRead(c, 'p')
```

At `Record`:

```
>>> let c = (x: 1, y: 2);
>>> (c::x, c::y, c::z)
(1, 2, nil)
```

This syntax is a counterpart to `Record Syntax`.

Where supported `::` is displayed as _·_.

* * *

See also: ::

Guides: At Syntax, Put Syntax, Record Syntax, Property Syntax

Unicode: U+00B7 · Middle Dot

Categories: Syntax

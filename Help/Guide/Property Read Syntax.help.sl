# Property Read Syntax

Rewrite rule:

- _c::p_ ⟹ _uncheckedSlotRead(c, 'p')_

```
>> 'r::p'.splSimplify
uncheckedSlotRead(r, 'p')
```

_c::p_ reads the value at the property _'p'_ from the record _r_.

At `Record`:

```
>>> let d = (x: 1, y: 2);
>>> d::x < d::y
true
```

This syntax is a counterpart to `Record Syntax`.

Where supported `::` is displayed as _·_.

* * *

See also: ::

Guides: At Syntax, Put Syntax, Record Syntax, Property Syntax

Unicode: U+00B7 · Middle Dot

Categories: Syntax

# Quoted At Syntax

Rewrite rule:

- _c::k_ ⟹ _c['k']_ ⟹ _at(c, 'k')_

Syntax for the `at` protocol.
_c::k_ reads the values at the key _'k'_ from the collection _c_.

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

Guides: At Syntax, Put Syntax, Record Syntax, Quoted Indexable Syntax

Unicode: U+00B7 · Middle Dot

Categories: Syntax

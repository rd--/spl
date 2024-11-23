# Value Protocol

`Block` and `Association` implement `value`, in particular _value:/1_, directly.

```
>>> { 1 }.value
1

>>> ('x' -> 1).value
1
```

Systems that implement the _Value Protocol_ also implement _value:/1_ at `Object`,
meaning that every value _evaluates_ to itself unless it re-implements _value:/1_.

```
>>> 1.value
1
```

This protocol allows writing methods that will accept either evaluated or delayed arguments.

In cases where this is not the behaviour wanted,
a `Block` can be required by using a direct form of _apply_ notation.

The Spl standard library mostly requires block arguments be blocks,
see for instance `&` and `|`.

* * *

See also: Association, Block, value

Guides: Apply Syntax, Value Apply Syntax

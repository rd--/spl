# Tuple Syntax

Tuples are written between parenthesis brackets.
Tuple items are separated by commas.

A three tuple of integers:

```
>>> (1, 2, 3)
(1, 2, 3)
```

A three tuple of expressions:

```
>>> (1 + 2, 3 * 4, 25.sqrt)
(3, 12, 5)
```

There is no syntax for writing either the empty tuple or the one-tuple.
_(:)_ answers the empty `Record` and _(x)_ answers the parenthesised value _x_:

```
>>> (:).isRecord
true

>>> (1).isInteger
true
```

_Rationale:_
It would be possible for _(,)_ to denote the empty tuple,
and for _(a,)_ the one tuple.

* * *

See also: List Syntax, Vector Syntax

Guides: Syntax Guides

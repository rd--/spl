# :: (colonColon)

`::` is a syntax token, it is not an operator.

`::` is a part of `Property Read Syntax` and `Property Write Syntax`.
It reads a value from a dictionary that has symbolic keys.

The expression _p::q_ is re-written as _p['q']_, which in turn is re-written as _at(p, 'q')_.

Where supported `::` is displayed as ·.

The name of this operator is `colonColon`.

* * *

See also: :, at

Guides: At Syntax, Property Read Syntax, Property Write Syntax, Syntax Tokens

Unicode: U+00B7 · Middle Dot

Categories: Syntax

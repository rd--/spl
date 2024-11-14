# .

`.` is a syntax token, it is not an operator.

A full stop separates the _receiver_ from the _method selector_ in `Method Syntax`:

```
>>> 9.sqrt
3

>>> 3.max(7)
7
```

A full stop separates the _procedure_ from the _parameter list_ in `Value Apply Syntax`:

```
>>> sqrt:/1 . (9)
3

>>> max:/2 . (3, 7)
7
```

The name of this syntax token is `fullStop`.

* * *

See also: :, ,, ;

Guides: Method Syntax, Syntax Tokens, Value Apply Syntax

Unicode: U+0002E . Full Stop

Categories: Syntax

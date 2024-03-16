# :/

Arity selector syntax.

When a method is declared two names are bound to it.

An arity specific name which dispatches to the type table,
and an arity generic name which dispatches to the arity table.

When a temporary variable is initialised to a literal block value,
the equivalent two names are bound.

The application syntax _f(x, y)_ rewrites _f_ to the arity-specific name, here _f:/2(x, y)_.
This is the ordinary notation for applying methods.
Therefore, in the ordinary case the arity dispatch is made statically and not dynamically,
and there is no possibility of arity errors.

The _:/_ syntax allows selecting the arity specific block,
which can be used to send it, rather than the arity-generic block, as an argument to another block.

Note that the application syntax cannot be used to apply a name that was not initialised using one of the ways noted above.

In particular blocks passed as arguments cannot be applied using this syntax,
and must be called using _apply_ or _value_.

```
>>> [sqrt(9), 9.sqrt, sqrt:/1.value(9), sqrt:/1 . (9)]
[3 3 3 3]
```

Where supported `:/` is displayed as ⧸.

* * *

Unicode: U+00B0 ⧸ Big Solidus

# Arity Syntax

When a method is declared the name it is bound to indicates the arity of the method.

Likewise when a temporary variable is initialised to a literal block value,
the variable defined indicates the arity of the block.

```
>>> let f = { };
>>> f/0.isBlock
true

>>> let f = { :x | x };
>>> f/1.isBlock
true
```

The application syntax _f(x, y)_ rewrites _f_ to the arity-specific name, here _f/2.
This is the ordinary notation for applying methods.
Therefore, in the ordinary case the arity dispatch is made statically and not dynamically,
and there is no possibility of arity errors.

The `/` syntax allows writing the name of the arity specific block,
allowing methods to be given as arguments to other methods,
or local variables to be arity-correct names

Note that the application syntax cannot be used to apply a name that was not initialised using one of the ways noted above.

In particular blocks passed as arguments cannot be applied using this syntax,
and must be called using _apply_ or _value_.

```
>>> [sqrt(9), 9.sqrt, sqrt/1.value(9), sqrt/1 . (9)]
[3 3 3 3]
```

* * *

See also: /

Guides: Syntax Guides

# Value Apply Syntax

- _f . ()_
- _f . (x, ...)_

This is the primitive `Block` application syntax.
_f_ must be a `Block` value,
it is applied to the arguments given within the parentheses.

No argument `Block`:

```
>>> { } . ()
nil
```

One argument `Block`:

```
>>> { :n | n * n } . (23)
529
```

Two argument `Block`:

```
>>> { :p :q | p ++ q } . ('x', 'y')
'xy'
```

Methods are blocks:

```
>>> sqrt:/1 . (529)
23
```

Operators are blocks:

```
>>> ^ . (23, 2)
529
```

* * *

See also: Apply Syntax, Block

Categories: Syntax

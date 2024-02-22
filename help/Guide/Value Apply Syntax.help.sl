# Value Apply Syntax

- _f . ()_
- _f . (x, ...)_

This is the primitive _Block_ application syntax.
_f_ must be a _Block_ value,
it is applied to the arguments given within the parentheses.

No argument Block:

```
>>> { } . ()
nil
```

One argument Block:

```
>>> { :n | n * n } . (23)
529
```

Two argument Block:

```
>>> { :p :q | p ++ q } . ('x', 'y')
'xy'
```

Methods are Blocks:

```
>>> sqrt:/1 . (529)
23
```

Operators are Blocks:

```
>>> ^ . (23, 2)
529
```

* * *

See also: Apply Syntax], Block

Categories: Syntax

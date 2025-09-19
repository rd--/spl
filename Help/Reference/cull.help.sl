# cull

- _cull(f:/n, x)_
- _cull(f:/n, x₁, x₂)_

Apply the block _f_ with two or one or zero arguments.

`cull` calls `numArgs` to ask how many arguments are required by _f_,
and passes only the required number of arguments.

A no-argument block with one argument:

```
>>> { }.cull(23)
nil
```

A no-argument block with two arguments:

```
>>> { }.cull(23, 3.141)
nil
```

A one-argument block with one argument:

```
>>> { :x | 0 - x }.cull(23)
-23
```

A one-argument block with two arguments:

```
>>> { :x | 0 - x }.cull(23, 3.141)
-23
```

A two-argument block with two arguments:

```
>>> { :x :y | x - y }.cull(23, 3.141)
19.859
```

* * *

See also: numArgs, value

Guides: Block Functions, Block Semantics

Categories: Evaluating

# cull

- _cull(f:/n, x)_
- _cull(f:/n, x₁, x₂…)_

Apply the block _f_ with up to _n_ arguments.

`cull` calls `numArgs` to ask how many arguments are required by _f_,
and passes only the required number of arguments.

A no-argument block with one and two arguments:

```
>>> { }.cull

>>> { }.cull(23)
nil

>>> { }.cull(23, 3.141)
nil
```

A one-argument block with one and two arguments:

```
>>> { :x | 0 - x }.cull(23)
-23

>>> { :x | 0 - x }.cull(23, 3.141)
-23
```

A two-argument block with two and three arguments:

```
>>> { :x :y | x - y }.cull(23, 3.141)
19.859

>>> { :x :y | x - y }.cull(23, 3.141, 2.718)
19.859
```

A three-argument block with three and four arguments:

```
>>> { :x :y :z | x * y + z }.cull(3, 5, 7)
22

>>> { :x :y :z | x * y + z }.cull(3, 5, 7, 9)
22
```

It is an error if there are too few arguments for the block:

```
>>> {
>>> 	{ :x :y | x - y }.cull(23)
>>> }.hasError
true
```

* * *

See also: numArgs, value

Guides: Block Functions, Block Semantics

Categories: Evaluating

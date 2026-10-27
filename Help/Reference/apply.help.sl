# apply

- _apply(f/0)_
- _apply(f/1, x)_
- _apply(f/n, x₁, x₂, …)_

The unary form,
an alias for `nullaryApply`,
answers the answer of the no-argument block _f_:

```
>>> { 23 }.apply
23
```

The binary form,
an alias for `unaryApply`,
answer the result of _f(x)_.

```
>>> { :x | x * x }.apply(23)
529

>>> square/1.apply(23)
529

>>> 23.square
529
```

The variant formulation of this with the arguments reversed is `in` or `with`,
so that _f.apply(x)_ is equal to _x.in(f)_ or _x.with(f)_.

```
>>> 23.in(square/1)
529
```

The ternary and quaternary forms,
aliases for `binaryApply` and `ternaryApply`,
answer the result of _f(x₁,x₂…)_:

```
>>> power/2.apply(23, 2)
529

>>> 23 ^ 2
529

>>> mod/3.apply(15, 12, 1)
3
```

It is an `error` if there are too few arguments:

```
>>> {
>>> 	{ :i | false }.apply
>>> }.hasError
true
```

It is an `error` if there are too many arguments:

```
>>> {
>>> 	{ :x | false }.apply(3, 4)
>>> }.hasError
true
```

There is a _non-strict_ mode of the compiler that will elide arity checks at `Block` evaluations.
This mode is off by default.

* * *

See also: Association, Block, $, also, applyWithReturn, cull, identity, in, nullaryApply, with

Guides: Dictionary Functions, Block Functions

References:
_Smalltalk_
5.4.2.2
5.4.4.2

Categories: Accessing, Evaluating

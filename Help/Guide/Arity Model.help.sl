# Arity Model

The lexical structure of block application,
_f(...)_,
and method definition,
_f { ... | ...}_,
and `let` binding of block literals,
_let f = { ... | ...}_,
all tell the arity of _f_.

The method definition and `let` binding syntaxes define a _qualified_ name _f/n_,
where _n_ is the arity of _f_.

The application syntax _f(x)_ means _f/1 . (x)_.

This compiles away arity dispatch, and ensures arity correctness.

In this model _f/n_ is the syntax for writing the name of a method.

```
>>> [9 16 25].collect(sqrt/1)
[3 4 5]
```

This rewriting rule is also applied to local literal block definitions.
Writing _let f = { :x | x + 1 };_ defines the local variable _f/1_.
Note that this rule only applies to literal blocks, it is a lexical rewriting.

However re-writing restricts how the application syntax can be used.
In particular it cannot be used to apply a name that was not defined using one of these two mechanisms.

This arises for all higher order blocks.
This is an additional rule that must be learned, making the language less simple.
If efficiency is a concern the higher order case is important to optimise.

In this model _cull_ can be applied at methods,
since the method block is of fixed arity:

```
>>> sqrt/1.cull(9, 25)
3
```

This arity model introduces a slightly complicated notation,
but it is for a simple and uniform semantics.

The Sᴘʟ standard libraries are written following this model.

This model avoids local shadowing of method names.
`PlanarCoordinates` implements unary methods `x` and `y`,
these are not shadowed by _x_ and _y_ variables:

```
>>> let x = 3.141;
>>> let y = 23;
>>> let p = PlanarCoordinates(x, y);
>>> p.x = x & { p.y = y }
true
```

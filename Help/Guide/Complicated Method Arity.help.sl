# Complicated Method Arity

The lexical structure of block application,
_f(...)_,
and method definition,
_f { ... | ...}_,
and `let` binding of block literals,
_let f = { ... | ...}_,
all tell the arity of _f_.

The method definition and `let` binding syntaxes can define a _qualified_ name _f:/n_,
where _n_ is the arity of _f_.

The application syntax _f(x)_ can mean _f:/1 . (x)_.

This compiles away arity dispatch, and ensures arity correctness.

In this model _:/_ is the syntax for writing the name of a method.
(In the simple model it is a comment.)

```
>>> [9 16 25].collect(sqrt:/1)
[3 4 5]
```

This rewriting rule is also applied to local block definitions.
Writing _let f = { :x | x + 1 };_ means _var f:/1; f:/1 = { :x | x + 1 };_.
(Note that this rule cannot be applied when assigning a block to a variable.)

However re-writing restricts how the application syntax can be used.
In particular it cannot be used to apply a name that was not defined using one of these two mechanisms.

This arises for all higher order blocks.
This is an additional rule that must be learned, making the language less simple.
If efficiency is a concern the higher order case is important to optimise.

In this model _cull_ can be applied at methods.
This is not possible in the simple model, since the method block is of variable arity.

```
>>> sqrt:/1.cull(9, 25)
3
```

This model is a more complicated notation, but for a simpler and more uniform semantics.

The Sᴘʟ standard libraries are written following this model.
Libraries written in this form will work when the compiler is in `Simple Method Arity` mode.
(The inverse is not the case.)

There is a compiler switch to select if local blocks are aliased to the unqualified name.
If the switch is selected then the program below could elide the arity annotation,
since the system inserts the binding _let f = f:/1;_.

```
>>> let f = { :x | x * x };
>>> [3 5 7].collect(f:/1)
[9, 25, 49]
```

This model has different shadowing behaviour to the simple model.
If the type _PlanarCoordinates_ implements _x_ and _y_ methods, these would be shadowed by _x_ and _y_ temporaries in the simple model.
Here the method _x:/1_ is not shadowed by a local variable _x_:

```
>>> let x = 3.141;
>>> let y = 23;
>>> let p = PlanarCoordinates(x, y);
>>> p.x = x & { p.y = y }
true
```

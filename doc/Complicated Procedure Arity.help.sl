# Complicated Procedure Arity

The lexical structure of both procedure appliction, _f(...)_, and method definition _f { ... | ...}_ tells us the arity of _f_.

The definition can define an arity strict method name _f:/n_, where _n_ is the in arity of _f_.

The application syntax _f(x)_ can mean _f:/1 . (x)_.

This compiles away arity dispatch, and ensures arity correctness.

_:/_ is the syntax for writing down the name of fixed arity methods.

```
[9, 16, 25].collect(sqrt) = [3, 4, 5]
[9, 16, 25].collect(sqrt:/1) = [3, 4, 5]
```

This rewriting rule can also be applied to local procedure definitions.
Writing _| f = { :x | x + 1 }; |_ means _|f = { :x | x + 1 }, f:/1 = f; |_.
(This rule cannot be applied at when assigning a procedure to a variable.)

However re-writing restricts how the application syntax can be used.
In particular it cannot be used to apply a name that was not defined using one of these two mechanisms.

This arises for all higher order procedures.
This is an additional rule that must be learned, making the language less simple.
If efficiency is a concern the higher order case is important to optimise.

In this model _cull_ can be applied at methods.
This is not possible in the simple model.

```
sqrt:/1.cull(9, 25) = 3
```

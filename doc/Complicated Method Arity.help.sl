# Complicated Method Arity

The lexical structure of both procedure application, _f(...)_, and method definition, _f { ... | ...}_, tells us the arity of _f_.

The method definition syntax can define a _qualified_ method name _f:/n_, where _n_ is the arity of _f_.

The application syntax _f(x)_ can mean _f:/1 . (x)_.

This compiles away arity dispatch, and ensures arity correctness.

In this model _:/_ is the syntax for writing the name of a method.
(In the simple model it is a comment.)

```
[9, 16, 25].collect(sqrt:/1) = [3, 4, 5]
```

This rewriting rule can also be applied to local procedure definitions.
Writing _| f = { :x | x + 1 }; |_ means _|f:/1 = { :x | x + 1 }; |_.
(This rule cannot be applied when assigning a procedure to a variable.)

However re-writing restricts how the application syntax can be used.
In particular it cannot be used to apply a name that was not defined using one of these two mechanisms.

This arises for all higher order procedures.
This is an additional rule that must be learned, making the language less simple.
If efficiency is a concern the higher order case is important to optimise.

In this model _cull_ can be applied at methods.
This is not possible in the simple model, since the method procedure is of variable arity.

```
sqrt:/1.cull(9, 25) = 3
```

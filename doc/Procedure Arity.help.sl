# Procedure Arity

If the host language supports variable arity procedures, the expression _sqrt(9)_ can be implemented by providing a variable arity procedure _sqrt_ that dynamically checks how many arguments it receives and dispatches to the appropriate place in the generics table.

However the lexical structure of both procedure appliction, _sqrt(9)_, and method definition _sqrt { :self | ...}_ tells us the arity of _sqrt_.

The definition can define an arity strict method name _sqrt:/1_ in addition to the arity generic name _sqrt_.
The application _sqrt(9)_ can mean _sqrt:/1.value(9)_.
This compiles away arity dispatch, and ensures arity correctness.

Here _:/_ is the syntax for writing down the name of fixed arity methods.
The two names give the same answer, but have different dispatch paths.
_c.collect(m)_ and _c.collect(m:/1)_ have the same meaning.

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

In Smalltalk _collect_ requires a block, _[9, 16, 25].collect { :each | sqrt(each) } = [3, 4, 5]_.

If the host language does not support variable arity procedures then the rule is decided for us.

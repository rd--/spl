# Method Arity

We consider three models for method arity.

In the first model method names are only used in the context of the application syntax, i.e. _f(x)_ or _x.f_.
In this model it is not possible to refer to a method by name, methods are not _values_ in the system.
To calculate the square root of each number in a collection an anonymous procedure must be written:

```
[9, 16, 25].collect { :each | each.sqrt } = [3, 4, 5]
```

If we are to write this directly it must be possible to refer to _sqrt_ by name.
There are two models for this, the first called [Simple Method Arity], the second [Complicated Method Arity].
There is a compiler switch to select between these two models.

In the simple model the name _sqrt_ refers to a variable arity procedure.
It dispatches first on the number of arguments it receives, and second on the type of the first argument.
While simple this model requires the interpreter perform two indirections at each procedure application,
and introduces into the system a kind of value (a variable arity procedure) that is not permitted in the language.

```
[9, 16, 25].collect(sqrt) = [3, 4, 5]
```

In the complicated model the name _sqrt:/1_ refers to a single argument procedure.
It dispatches on the type of the first argument.
In this model the notation _sqrt(9)_ is syntax for _sqrt:/1 . (9)_.
Where this model introduces a more complicated rule for method names,
it requires only one indirection at each procedure application,
and does not require variable arity procedures.

```
[9, 16, 25].collect(sqrt:/1) = [3, 4, 5]
```

This syntax is allowed in the simple model, where the arity qualifier is treated as a comment.

In both models asking for the arity of a method is an error, though of different kinds.

In the simple model _sqrt.numArgs_ is an error because _sqrt_ is a variable arity procedure.
In the complicated model _sqrt.numArgs_ is an error because _sqrt_ is not the name of a procedure.
In the complicated model _sqrt:/1.numArgs = 1_, however it is also a tautology.

In both models there is no general mechanism to invoke a procedure at an array of arguments.
(At present _apply_ is implemented, but it should not be.)

If the host language does not support variable arity procedures then the rule is decided for us.

_Note:_ The anonymous procedure notation works with both of the models for method values described,
and this notation is compatible with the _.stc_ notation for Smalltalk.

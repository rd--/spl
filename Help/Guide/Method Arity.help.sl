# Method Arity

We consider three models for method arity.

In the first model method names are only used in the context of the application syntax, i.e. _f(x)_ or _x.f_.
In this model it is not possible to refer to a method by name, methods are not _values_ in the system.
To calculate the square root of each number in a collection an anonymous function must be written:

```
>>> [9, 16, 25].collect { :each | each.sqrt }
[3 4 5]
```

If we are to write this directly it must be possible to refer to `sqrt` by name.
There are two models for this, the first called `Simple Method Arity`, the second `Complicated Method Arity`.
There is a compiler switch to select between these two models.

In the simple model the name `sqrt` refers to a variable arity function.
It dispatches firstly on the number of arguments it receives,
and secondly on the type of the first argument.
While simple this model requires the interpreter perform two indirections at each function application,
and introduces into the system a kind of value
(a variable arity function)
that is not permitted in the language.
The simple arity model allows eliding the arity qualifier (/1) in the expression below:

```
>>> [9 16 25].collect(sqrt/1)
[3 4 5]
```

In the complicated model the name _sqrt/1_ refers to a single argument function.
It dispatches on the type of the first argument.
In this model the notation _sqrt(9)_ is syntax for something like _unaryApply(sqrt/1, 9)_.
Where this model introduces a more complicated rule for method names,
it requires only one indirection at each function application,
and does not require variable arity functions.

```
>>> [9 16 25].collect(sqrt/1)
[3 4 5]
```

This syntax is allowed in the simple model, where the arity qualifier is treated as a comment.

In both models asking for the arity of a method is an error, though of different kinds.

In the simple model _sqrt.arity_ is an error because `sqrt` is a variable arity function.
In the complicated model _sqrt.arity_ is an error because `sqrt` is not the name of a function.
In the complicated model _sqrt/1.arity = 1_, however it is also a tautology.

In both models there is no general mechanism to invoke a function at an array of arguments.
(At present `apply` is implemented, but it should not be.)

If the host language does not support variable arity functions then the rule is decided for us.

_Note:_ The anonymous function notation works with both of the models for method values described,
and this notation is compatible with the _.stc_ notation for Smalltalk.

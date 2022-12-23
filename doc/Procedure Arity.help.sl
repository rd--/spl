# Procedure Arity

Procedures have a fixed arity, as in Smalltalk.
There are no optional parameters or _rest_ arguments.

There are two models, a compiler switch selects between them.

One model is called [Simple Procedure Arity], the other [Complicated Procedure Arity].

Writing anonymous procedures for higher order cases has the same notation in both models.

```
[9, 16, 25].collect { :each | each.sqrt } = [3, 4, 5]
```

In both models asking for the arity of a method is an error, though of different kinds.

In the simple model _max.numArgs_ is an error because _max_ is a variable arity procedure.
In the complicated model _max.numArgs_ is an error because _max_ is not the name of a procedure.
In the complicated model _max:/1.numArgs = 1_, however it is also a tautology.

In both models there is no general mechanism to invoke a procedure at an array of arguments.
(At present _apply_ is implemented, but it should not be.)

If the host language does not support variable arity procedures then the rule is decided for us.

* * *

See also: [Smalltalk Arity]

# Experimental Simple Method Arity

The expression _sqrt(9)_ can be implemented by providing a variable arity block _sqrt_ that dynamically checks how many arguments it receives and dispatches to the appropriate place in the `Method Dictionary`.

```
>>> { [9 16 25].collect(sqrt) }.hasError
true
```

It is one of the properties of the simple model that the blocks that implement the model are of a type that the model does not allow.
In this model _sqrt.numArgs_ is an error, and therefore _cull_ also.

```
>>> { sqrt.cull(9, 25) }.hasError
true
```

This notation is intuitive and clear and simple.
The name of the method value is the same as the name of the method when applied.

It is also possible to define both an arity specific name which dispatches to the type table,
and an arity generic name which dispatches to the arity table.

* * *

Status: Disallowed, Experimental

# Simple Method Arity

The expression _sqrt(9)_ can be implemented by providing a variable arity block _sqrt_ that dynamically checks how many arguments it receives and dispatches to the appropriate place in the `Method Dictionary`.

```
>>> [9 16 25].collect(sqrt:/1)
[3 4 5]
```

It is one of the properties of the simple model that the blocks that implement the model are of a type that the model does not allow.
In this model _sqrt.numArgs_ is an error, and therefore _cull_ also.

```
>>> { sqrt:/1.cull(9, 25) }.ifError { true }
3
```

This notation is intuitive and clear and simple.
The name of the method value is the same as the name of the method when applied.

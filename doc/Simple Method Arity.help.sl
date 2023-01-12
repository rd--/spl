# Simple Method Arity

The expression _sqrt(9)_ can be implemented by providing a variable arity procedure _sqrt_ that dynamically checks how many arguments it receives and dispatches to the appropriate place in the [Method Table].

```
[9, 16, 25].collect(sqrt) = [3, 4, 5]
```

It is one of the properties of the simple model that the procedures that implement the model are of a type that the model does not allow.
In this model _sqrt.numArgs_ is an error, and therefore _cull_ also.

```
{ sqrt.cull(9, 25) }.ifError { true }
```

The simple model encourages a style of writing that makes programs more like Smalltalk programs, using literal blocks as parameters to methods that require behaviours.

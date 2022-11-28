# Generic Procedures

The standard environment of  `Spl` is defined in terms of a method table.
Library procedures dispatch on the number of arguments (called _arity_) and on the type of the first argument.

In _f(x, y)_, if _f_ has no two-arity method for the type of _x_ the two-arity method for the universal type _Object_ is selected, if it exists.
In _f()_ the method for the uninhabited type _Void_ is selected.

Indexing on arity allows distinct methods to have the same name,
for instance _p.x_ may access a slot _x_ and _p.x(i)_ may set the value of the slot.

# Generic Procedures

The standard environment is defined in terms of a method table.
Library procedures dispatch on the number of arguments (called _arity_) and on the type of the first argument.

In _f(x, y)_, if _f_ has no two-arity method for the type of _x_ the two-arity method for the universal type _Object_ is selected, if it exists.
In _f()_ the method for the uninhabited type _Void_ is selected.

Indexing on arity allows distinct methods to have the same name.
The reader and writer methods for types have this behaviour.
If _p.x_ reads the field _x_, _p.x(i)_ sets the value of the field.

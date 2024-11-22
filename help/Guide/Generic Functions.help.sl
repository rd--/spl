# Generic Functions

In §28.1.6 of _Common Lisp the Language_ a generic function is defined as:

> a function whose behavior depends on the classes or identities of the arguments supplied to it.
> The methods define the class-specific behavior and operations of the generic function.
> (Steele 1984)

The standard environment is defined in terms of a method table.
Methods dispatch on the number of arguments (called _arity_) and on the type of the first argument.

In _f()_ the method for the uninhabited pseudo-type `Void` is selected.

Indexing on arity allows distinct methods to have the same name.
The reader and writer methods for types have this behaviour.
If _p.x_ reads the field _x_, _p.x(i)_ sets the value of the field.

All standard types implement the trait `Object`.

* * *

See also: Method

Guides: Defining Methods

Further Reading: Steele 1990

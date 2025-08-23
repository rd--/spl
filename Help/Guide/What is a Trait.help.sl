# What is a Trait?

A `Trait` is a collection of behaviours,
in much the same way that _abstract classes_ are in Smalltalk.

In Smalltalk `Collection` is an abstract class,
in Sᴘʟ it is a trait.

The name trait is from Self (Ungar and Smith 1987).

`Type`s are said to _implement_ traits.

Each trait has a set of _required methods_,
which a type must implement if it to implement the trait.

We can ask the system which traits a given type implements:

```
>>> system.typeTraits('List')
>>> .includes('Sequenceable')
true
```

A type receives copies of the methods defined in each of the traits it implements.
The traits are applied in the sequence they are listed in the type definition.
Methods defined by traits applied later in the sequence can override methods defined by traits that are applied earlier.

Traits must be loaded before Types.
When a type is added, methods for the traits that it implements are added to the dispatch table at the new type.
When a trait is extended methods are added both to the trait entry and to the dispatch table for all types that implement the trait.

To distinguish traits from types traits are sometimes written with an `@` prefix, which corresponds to the syntax used to define them.

_Note:_ At present re-defining methods of traits is not safe.
Redefinitions should not be applied to a type if there is a more specific method defined.
A definition is more specific if it is defined at the type, or at a trait that is later in the trait sequence.

* * *

See also: Trait

Guides: Reflection Functions, What is a Type

Further Reading: Ungar and Smith 1987

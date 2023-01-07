# What is a Trait?

A _trait_ is a collection of behaviours, in much the same way that _abstract classes_ are in Smalltalk.
In Smalltalk _Collection_, _SequenceableCollection_ and _ArrayedCollection_ are abstract classes, here they are traits.
Since _Procedures_ are the only kind of behaviour in the system, traits are a collection of _Procedures_.

Types are said to implement a trait.
_Array_ implements all three of the above traits.
_IdentityDictionary_ implements _Collection_.

This means that _Array_ receives copies of the methods defined in each of the traits it implements.
The traits are applied in the sequence they are listed in the type definition.
Methods defined by traits applied later in the sequence can override methods defined by traits that are applied earlier.

Traits must be loaded before Types.
When a type is added, methods for the traits that it implements are added to the dispatch table at the new type.
When a trait is extended methods are added both to the trait entry and to the dispatch table for all types that implement the trait.

```
system.traitMethods('Collection').keys
```

_Note:_ At present re-defining methods of traits is not safe.
Redefinitions should not be applied to a type if there is a more specific method defined.
A definition is more specific if it is defined at the type, or at a trait that is later in the trait sequence.

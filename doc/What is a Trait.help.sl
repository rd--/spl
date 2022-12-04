# What is a Trait?

A _trait_ is a collection of behaviours.

In SmallTalk _Collection_, _SequenceableCollection_ and _ArrayedCollection_ are abstract classes.
Abstract classes define behaviour but cannot be instatiated.

In Spl the definition of the _Array_ type begins:

```
Array : [Collection, SequenceableCollection, ArrayedCollection] {
...
}
```

This means that _Array_ receives copies of the methods defined in each of the name traits.
The traits are applied in sequence.
Methods defined by traits applied later in the sequence can override methods defined by traits that are applied earlier.

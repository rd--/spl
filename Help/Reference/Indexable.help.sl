# Indexable

`Indexable` is a collection `Trait`.
The required methods are:

- `at`
- `atPut`
- `indices`
- `size`

The `At Syntax` and `AtPut Syntax` are implemented in terms of `Indexable` methods.

The `Dictionary` types are `Indexable` so that one may use this array indexing syntax for dictionaries.

Note, however, that `atAll` is not at `Indexable`, but instead at `Sequence` since it requires `species` to decide the answer type.

`Indexable` is a trait:

```
>>> let d = system.traitDictionary;
>>> d['Indexable'].isTrait
true
```

`List` is `Indexable`:

```
>>> let t = system.traitTypes('Indexable');
>>> t.includes('List')
true
```

* * *

See also: at, atPut, Collection, includesIndex, indices, indicesDo, size, withIndexDo

Guides: Dictionary Functions, Indexing Functions, List Functions

Categories: Trait

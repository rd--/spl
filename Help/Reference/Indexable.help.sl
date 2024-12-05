# Indexable

`Indexable` is a collection `Trait`.
The required methods are `at`, `atPut`, `indices` and `size`.

Notably the `At Syntax` and `AtPut Syntax` are implemented in terms of `Indexable` methods.
The `Dictionary` types are `Indexable` so that one may use this array indexing syntax for dictionaries.

```
>>> let t = system.traitTypes('Indexable');
>>> t.includes('List')
true

>>> let d = system.traitDictionary;
>>> d['Indexable'].isTrait
true
```

* * *

See also: at, atPut, Collection, includesIndex, indices, indicesDo, Keyed, size, withIndexDo

Categories: Trait

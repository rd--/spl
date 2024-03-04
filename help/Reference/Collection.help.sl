# Collection

`Collection` is a `Trait` holding behaviours common to collections.

```
>>> system.traitDictionary['Collection'].isTrait
true

>>> system.traitTypes('Collection').includes('List')
true
```

`size` and `do` are the basic methods of a collection.

Methods for testing: `isEmpty`, `occurrencesOf`, `anySatisfy`, `allSatisfy`, `includes`, `includesAllOf`, `includesAnyOf`

Methods for accessing: `anyOne`

Methods for enumerating: `do`, `doSeparatedBy`, `select`, `reject`, `collect`, `detect`, `detectIfNone`, `injectInto`, `collectThenSelect`, `selectThenCollect`, `count`

Methods for set logic: `difference`

* * *

See also: Dictionary, do, SequenceCollection, size

References:
_Smalltalk_
5.7.1

Categories: Collection, Trait

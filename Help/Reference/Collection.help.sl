# Collection

`Collection` is a `Trait` holding behaviours common to collections.

The required methods are `size` and `do`,
meaning that all collections can also implement `Iterable`.

```
>>> system
>>> .traitDictionary['Collection']
>>> .isTrait
true

>>> system
>>> .traitTypes('Collection')
>>> .includes('List')
true
```

Methods for testing: `isEmpty`, `occurrencesOf`, `anySatisfy`, `allSatisfy`, `includes`, `includesAllOf`, `includesAnyOf`

Methods for accessing: `anyOne`

Methods for enumerating: `do`, `doSeparatedBy`, `select`, `reject`, `collect`, `detect`, `detectIfNone`, `injectInto`, `collectThenSelect`, `selectThenCollect`, `count`

Methods for set logic: `difference`

* * *

See also: Dictionary, do, Sequence, size

References:
_Smalltalk_
5.7.1

Categories: Collection, Trait

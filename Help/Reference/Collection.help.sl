# Collection

`Collection` is a `Trait` holding behaviours common to collections.

The required methods are `do` and `size`,
meaning that all collections can also implement `Iterable`:

- `do`
- `size`

Methods for testing

- `allSatisfy`
- `anySatisfy`
- `includesAll`
- `includesAny`
- `includes`
- `isEmpty`
- `occurrencesOf`

Methods for enumerating:

- `do`
- `doSeparatedBy`
- `select`
- `reject`
- `collect`
- `detect`
- `detectIfNone`
- `injectInto`
- `collectThenSelect`
- `selectThenCollect`
- `count`

Methods for set logic:

- `difference`

Collection is a trait:

```
>>> system
>>> .traitDictionary['Collection']
>>> .isTrait
true
```

`List` implements `Collection`:

```
>>> system
>>> .traitTypes('Collection')
>>> .includes('List')
true
```

* * *

See also: Dictionary, do, Sequence, size

Guides: Dictionary Functions, List Functions

References:
_Smalltalk_
5.7.1

Categories: Collection, Trait

# Dictionary

`Dictionary` is a `Trait` that holds behaviours common to collections of _(key, value)_ associations.

Dictionaries are homogenous sets of key and value pairs.
These pairs are called associations.
key and value can be any object.
Associations are created by sending the binary operator _key -> value_ (`->` is defined at `Object`).
Dictionaries have the property that each key occurs at most once.
For both `Map` and `Record` the uniqueness of keys is determined using `==`, not `=`.
Dictionaries are indexed using the unique `key` to obtain the corresponding `value`.

```
>>> system.traitTypes('Dictionary').includes('Map')
true

>>> system.traitDictionary::Dictionary.isTrait
true
```

Methods for accessing: at, atIfAbsent, associationAt, associationAtIfAbsent, keyAtValue, keyAtValueIfAbsent, keys, values

Methods for testing: includes, includesKey

Methods for enumerating: do, keysDo, valuesDo, keysAndValuesDo, associationsDo

* * *

See also: Association, AssociationList, Map, Record

Categories: Collection, Trait

# Dictionary

_Dictionary_ is a trait holding behaviours common to collections of (key, value) associations.

Dictionaries are homogenous sets of key and value pairs.
These pairs are called associations, key and value can be any object.
Associations are created by sending the binary message "key -> value" (-> is defined at _Object_).
Dictionaries have the property that each key occurs at most once.
For both Map and Record the uniqueness of keys is determined using ==.
Dictionaries are indexed using the unique key to obtain the corresponding value.

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

See also: Association, Map, Record

Categories: Collection, Trait

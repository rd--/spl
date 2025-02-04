# Dictionary

- _Dictionary()_

`Dictionary` is a `Trait`,
and an assocaited `Type`,
that holds behaviours common to collections of _(key, value)_ associations.

Dictionaries are homogenous sets of key and value pairs.
These pairs are called associations.
key and value can be any object.
Associations are created by sending the binary operator _key -> value_ (`->` is defined at `Object`).
Dictionaries have the property that each key occurs at most once.
For both `Map` and `Record` the uniqueness of keys is determined using `==`,
for `Dictionary` it is determined using `=`.
Dictionaries are indexed using the unique `key` to obtain the corresponding `value`.

```
>>> system
>>> .traitTypes('Dictionary')
>>> .includes('Map')
true

>>> system
>>> .traitDictionary['Dictionary']
>>> .isTrait
true
```

The `Dictionary` type is less efficient than both `Map` and `Record`.

An empty `Dictionary`:

```
>>> let d = Dictionary();
>>> (d.size, d.isEmpty, d.printString)
(0, true, '[].asDictionary')

>>> [].asDictionary.size
0
```

An `Dictionary` with lists for keys:

```
>>> let d = [
>>> 	[1 2] -> 3,
>>> 	[4 5] -> 6
>>> ].asDictionary;
>>> (
>>> 	d.keys,
>>> 	d.keys.collect { :each | d[each] },
>>> 	d.values
>>> )
([1 2; 4 5], [3 6], [3 6])
```

Methods for accessing: at, atIfAbsent, associationAt, associationAtIfAbsent, keyAtValue, keyAtValueIfAbsent, keys, values

Methods for testing: includes, includesKey

Methods for enumerating: do, keysDo, valuesDo, keysAndValuesDo, associationsDo

* * *

See also: Association, Map, Record

Categories: Collection, Trait
